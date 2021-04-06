class Api::V1::ContractsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_contract, only: [ :show, :update ]

  def create
    @contract = Contract.new(contract_params)
    authorize @contract
    if @contract.save

      if subscription_params[:users]
        subscription_params[:users].each do |subscriber|
          @subscription = Subscription.new(user_id: subscriber.to_i, contract: @contract)
          unless @subscription.save
            render_subscription_error
            return
          end

          
        end
      end
      
      if contract_option_params[:options]
        contract_option_params[:options].each do |option|
          @contract_option = ContractOption.new(option_id: option.to_i, contract: @contract)
          unless @contract_option.save
            render_contract_option_error 
            return
          end
        end
      end
    
      render :show, status: :created
    else
      render_error
    end
  end

  def index
    @contracts = policy_scope(Contract)
    unless current_user.admin
      @contracts = @contracts.select do |contract|
        contract.users.include?(current_user)
      end
    end
    authorize @contracts
  end

  def show
  end

  def update
    end_date = contract_params[:end_date]
    if Date.parse(end_date) < Date.today
      render json: { errors: "end_date can't be before today!" }
      return
    end

    @contract.update(end_date: end_date)
    if @contract.save
      render :show
    else
      render_error
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
    authorize @contract
  end

  def contract_params
    params.require(:contract).permit(:number, :start_date, :end_date)
  end

  def contract_option_params
    params.fetch(:contract_option, {}).permit(:options => [])
  end

  def subscription_params
    params.fetch(:subscription, {}).permit(:users => [])
  end

  def render_error
    render json: { errors: @contract.errors.full_messages },
      status: :unprocessable_entity
  end

  def render_subscription_error
    render json: { errors: @subscription.errors.full_messages },
      status: :unprocessable_entity
  end

  def render_contract_option_error
    render json: { errors: @contract_option.errors.full_messages },
      status: :unprocessable_entity
  end
end

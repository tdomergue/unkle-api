class Api::V1::ContractsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_contract, only: [ :show ]

  def create
    @contract = Contract.new(contract_params)
    authorize @contract
    if @contract.save
      render json: { success: "contract created! Now attach client(s) and option(s) by creating Subscription(s) and ContractOption(s)..." }, status: :created
      # render :show, status: :created
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

  private

  def set_contract
    @contract = Contract.find(params[:id])
    authorize @contract
  end

  def contract_params
    params.require(:contract).permit(:number, :start_date, :end_date)
  end

  def render_error
    render json: { errors: @contract.errors.full_messages },
      status: :unprocessable_entity
  end
end

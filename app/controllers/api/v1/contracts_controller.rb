class Api::V1::ContractsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @contract = Contract.new(contract_params)
    @subscription = Subscription.new(subscription_params)
    p subscription_params
    @subscription.contract = @contract
    authorize @contract
    authorize @subscription
    if @contract.save && @subscription.save
      render json: { success: "contract and subscription created!" }, status: :created
      # render :show, status: :created
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @contract.errors.full_messages },
      status: :unprocessable_entity
  end

  def contract_params
    params.require(:contract).permit(:number, :start_date, :end_date)
  end

  def subscription_params
    params.require(:subscription).permit(:user_id, :contract_id)
  end
end

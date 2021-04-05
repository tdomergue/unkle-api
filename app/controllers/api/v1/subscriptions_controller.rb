class Api::V1::SubscriptionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @subscription = Subscription.new(subscription_params)
    authorize @subscription
    if @subscription.save
      render json: { success: "subscription created!" }, status: :created
      # render :show, status: :created
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @subscription.errors.full_messages },
      status: :unprocessable_entity
  end

  def subscription_params
    params.require(:subscription).permit(:user_id, :contract_id)
  end
end

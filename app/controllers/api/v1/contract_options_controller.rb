class Api::V1::ContractOptionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    @contract_option = ContractOption.new(contract_option_params)
    authorize @contract_option
    if @contract_option.save
      render json: { success: "contract_option created!" }, status: :created
      # render :show, status: :created
    else
      render_error
    end
  end

  private

  def render_error
    render json: { errors: @contract_option.errors.full_messages },
      status: :unprocessable_entity
  end

  def contract_option_params
    params.require(:contract_option).permit(:contract_id, :option_id)
  end
end

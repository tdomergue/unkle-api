class Api::V1::ContractsController < Api::V1::BaseController

  def create
    @contract = Contract.new(contract_params)
    authorize @contract
    if @contract.save
      render json: { "contract created!" }
      # render :show
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
end

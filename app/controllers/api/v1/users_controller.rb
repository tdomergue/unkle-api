class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_user, only: [ :show, :destroy ]

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def show
  end

  def create
    @user = User.new(user_params)
    @user.password = "UnkleAPI"
    authorize @user
    if @user.save
      render :show, status: :created
      SendWelcomeMailJob.perform_later(@user)
    else
      render_error
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :admin)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end

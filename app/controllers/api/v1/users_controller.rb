class Api::V1::UsersController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def create
    @user = User.new(user_params)
    @user.password = "UnkleAPI"
    authorize @user
    if @user.save
      puts "Created"
    else
      render_error
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :admin, :password)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end

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
      send_welcome_email(@user)
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

  def send_welcome_email(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
    reset_pwd_url = "http://localhost:3000/users/password/edit?reset_password_token=#{raw}"
    UserMailer.welcome(user, reset_pwd_url).deliver_later
  end
end

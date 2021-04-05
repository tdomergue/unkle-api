class SendWelcomeMailJob < ApplicationJob
  queue_as :default

  def perform(user)
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    user.reset_password_token = hashed
    user.reset_password_sent_at = Time.now.utc
    user.save
    reset_pwd_url = "http://localhost:3000/users/password/edit?reset_password_token=#{raw}"
    UserMailer.welcome(user, reset_pwd_url).deliver_later
  end
end

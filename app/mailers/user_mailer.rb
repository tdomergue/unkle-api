class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user, reset_pwd_url)
    @user = user
    @reset_pwd_url = reset_pwd_url

    mail to: user.email, subject: 'Vous avez été invité sur teamworkinteact'
  end
end

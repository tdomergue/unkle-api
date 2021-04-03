require 'uri'

class User < ApplicationRecord
  after_create :send_welcome_email, unless: self == User.first

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

  has_many :subscriptions, dependent: :destroy
  has_many :contracts, through: :subscriptions

  validates :email, :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def send_welcome_email
    raw, hashed = Devise.token_generator.generate(User, :reset_password_token)
    self.reset_password_token = hashed
    self.reset_password_sent_at = Time.now.utc
    self.save
    reset_pwd_url = "http://localhost:3000/users/password/edit?reset_password_token=#{raw}"
    UserMailer.welcome(self, reset_pwd_url).deliver_later
  end
end

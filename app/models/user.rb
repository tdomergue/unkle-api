require 'uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :contracts, through: :subscriptions

  validates :email, :password, :admin, :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end

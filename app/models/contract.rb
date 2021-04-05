class Contract < ApplicationRecord

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  has_many :contract_options, dependent: :destroy
  has_many :options, through: :contract_options

  validates :number, :start_date, presence: true
  validates :number, uniqueness: true

  validate :start_before_end

  def status
    if Date.today < start_date
      "pending"
    elsif Date.today > end_date
      "finished"
    else
      "active"
    end
  end

  def options_title
    self.options.map do |option|
      option.title
    end
  end

  def users_full_name
    self.users.map do |user|
      user.full_name
    end
  end

  private

  def start_before_end
    errors.add :end_date, "must be after start_date" if start_date && end_date && end_date <= start_date
  end
end

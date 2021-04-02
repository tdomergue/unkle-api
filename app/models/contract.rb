class Contract < ApplicationRecord

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :number, :start_date, presence: true
  validates :number, uniqueness: true

  validate :start_before_end

  def status
    if Date.today < start_date
      status = "pending"
    elsif Date.today > end_date
      status = "finished"
    else
      status = "active"
    end
  end

  private

  def start_before_end
    errors.add :end_date, "must be after start_date" if start_date && end_date && end_date <= start_date
  end
end

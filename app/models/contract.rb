class Contract < ApplicationRecord

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :number, :status, :start_date, presence: true
  validates :number, uniqueness: true

  validates_inclusion_of :status, in: %w(pending active finished)

  validate :start_before_end

  private

  def start_before_end
    errors.add :end_date, "must be after start_date" if start_date && end_date && end_date <= start_date
  end
end

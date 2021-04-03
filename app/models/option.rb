class Option < ApplicationRecord
  
  has_many :contract_options, dependent: :destroy
  has_many :contracts, through: :contract_options

  validates :title, :identifier, presence: true
  validates_length_of :title, maximum: 100
end

class Option < ApplicationRecord

  validates :title, :identifier, presence: true
  validates_length_of :title, maximum: 100
end

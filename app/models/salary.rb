class Salary < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, allow_destroy: true
  validates :hr, :hourly_wage, presence: true
  validates :hr, :hourly_wage, numericality: { greater_than_or_equal_to: 0 }
end

class Salary < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, allow_destroy: true
  validates :date, :hr, :hourly_wage, presence: true
  validates :hr, numericality: { greater_than_or_equal_to: 1 }
  validates :hourly_wage, numericality: { greater_than_or_equal_to: 150 }

  def self.search(search)
    if search
      where(['date LIKE ?', "%#{search}%"])
    else
      all
   end
  end
end
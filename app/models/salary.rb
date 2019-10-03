class Salary < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, allow_destroy: true
  validates :date, :hr, :hourly_wage, presence: true
  validates :hr, numericality: { greater_than_or_equal_to: 1 }
  validates :hourly_wage, numericality: { greater_than_or_equal_to: 150 }

  paginates_per 10

  def self.search(search)
    if search
      if search.empty?
        all
      else
        year = search.split(/-/)[0].to_i
        month =  search.split(/-/)[1].to_i
        beginning_of_month = DateTime.new(year, month).beginning_of_month
        end_of_month = beginning_of_month.end_of_month
        where(date: beginning_of_month..end_of_month)
      end
    else
      all
   end
  end
end
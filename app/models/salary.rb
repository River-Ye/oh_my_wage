class Salary < ApplicationRecord
  belongs_to :user
  accepts_nested_attributes_for :user, allow_destroy: true
  validates :date, :hr, :hourly_wage, presence: true
  validates :hr, numericality: { greater_than_or_equal_to: 1 }
  validates :hourly_wage, numericality: { greater_than_or_equal_to: 150 }

  paginates_per 10

  def self.search(month_date = nil)
    return all if month_date.blank?
    beginning_of_month = month_date.beginning_of_month.beginning_of_day
    end_of_month = month_date.end_of_month.end_of_day
    where(date: beginning_of_month..end_of_month)
  end

  def self.this_month
    where(date: when_monthly)
  end

  def self.when_monthly
    beginning_of_month = Date.today.beginning_of_month.beginning_of_day
    end_of_month = beginning_of_month.end_of_month
    beginning_of_month..end_of_month
  end
end
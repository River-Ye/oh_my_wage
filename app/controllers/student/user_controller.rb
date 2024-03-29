class Student::UserController < ApplicationController
  before_action :check_login
  before_action :find_when_monthly_salary, only: [:index]
  before_action :find_student_salaries, only: [:history]

  def index
  end

  def history
    if search_month.blank?
      @salary_chart_by_day = Salary.search(search_month).where(user_id: current_user).group_by_month(:date).sum(:hr)
    else
      @salary_chart_by_day = Salary.search(search_month).where(user_id: current_user).group_by_day(:date).sum(:hr)
    end
  end

  private

  def find_when_monthly_salary
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = beginning_of_month.end_of_month
    @salary = current_user.salaries.where(date: beginning_of_month..end_of_month).order(date: :desc)
  end

  def find_student_salaries
    @salary = current_user.salaries.search(search_month).page(params[:page])
  end

  def search_month
    return if params[:search].blank?
    t = params[:search]
    year = t.split(/-/)[0].to_i
    month =  t.split(/-/)[1].to_i
    Date.new(year, month)
  end

  def check_login
    redirect_to '/', notice: "權限不足!!" unless user_signed_in? && current_user.student?
  end
end
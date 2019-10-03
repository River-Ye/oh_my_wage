class Student::UserController < ApplicationController
  before_action :check_login
  before_action :find_when_monthly_salary, only: [:index]
  before_action :find_student_salaries, only: [:history]

  def index
  end

  def history
  end

  private

  def find_when_monthly_salary
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = beginning_of_month.end_of_month
    @salary = current_user.salaries.where(date: beginning_of_month..end_of_month).order(date: :desc)
  end

  def find_student_salaries
    @student = current_user.salaries.search(params[:search]).order(date: :desc).page(params[:page])
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'student'
  end
end
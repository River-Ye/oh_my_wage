class Student::UserController < ApplicationController
  before_action :check_login
  before_action :find_salary, only: [:show, :history]

  def index
    @salary = Salary.all
  end

  def history
  end

  private

  def find_salary
    @salary = current_user.salaries
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'student'
  end
end
class Student::UserController < ApplicationController
  before_action :check_login

  def index
    @salary = Salary.all
  end

  def history
  end

  private

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'student'
  end
end
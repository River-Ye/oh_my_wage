class Student::UserController < ApplicationController
  before_action :check_login
  before_action :find_student_salaries, only: [:history]

  def index
  end

  def history
  end

  def search
  end

  private

  def find_student_salaries
    @student = current_user.salaries.search(params[:search]).order(date: :desc)
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'student'
  end
end
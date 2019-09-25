class HomeController < ApplicationController
  def index
    redirect_to student_path if user_signed_in? && current_user.role == 'student'
    redirect_to teacher_path if user_signed_in? && current_user.role == 'teacher'
  end

  def about
  end

  def qa
  end

  def contact
  end
end
class HomeController < ApplicationController
  def index
    redirect_to admin_path if user_signed_in? && current_user.role == 'admin'
    redirect_to student_path if user_signed_in? && current_user.role == 'student'
    redirect_to staff_path if user_signed_in? && current_user.role == 'staff'
  end

  def about
  end

  def qa
  end

  def contact
  end
end
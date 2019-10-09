class HomeController < ApplicationController
  def index
    redirect_to admin_root_path if user_signed_in? && current_user.role == '管理者'
    redirect_to staff_root_path if user_signed_in? && current_user.role == '職員'
    redirect_to student_root_path if user_signed_in? && current_user.role == '學生'
  end

  def about
  end

  def qa
  end

  def contact
  end
end
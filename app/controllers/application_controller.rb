class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    
    # byebug
    return stored_location_for(resource) || student_path if @user.role == 'student'
    return stored_location_for(resource) || teacher_path if @user.role == 'teacher'
    return stored_location_for(resource) || student_path(@user) if @user.role == 'admin'
  end
end

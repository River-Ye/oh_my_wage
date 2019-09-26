class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    return stored_location_for(resource) || admin_path if @user.role == "admin"
    return stored_location_for(resource) || staff_path if @user.role == "staff"
    return stored_location_for(resource) || student_path if @user.role == "student"
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :number, :name, :role, :phone, :gender)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :number, :name, :role, :phone, :gender)}
  end
end
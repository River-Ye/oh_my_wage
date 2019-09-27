class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def after_sign_in_path_for(resource)
    return stored_location_for(resource) || admin_path if @user.role == "admin"
    return stored_location_for(resource) || staff_path if @user.role == "staff"
    return stored_location_for(resource) || student_path if @user.role == "student"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:number, :name, :role, :phone, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :number, :name, :role, :phone, :gender])
  end
end
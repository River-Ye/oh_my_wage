class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :not_authorize

  private

  def after_sign_in_path_for(resource)
    return stored_location_for(resource) || root_path if @user == nil
    return stored_location_for(resource) || admin_root_path if @user.role == "admin"
    return stored_location_for(resource) || staff_root_path if @user.role == "staff"
    return stored_location_for(resource) || student_root_path if @user.role == "student"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:number, :name, :role, :phone, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :number, :name, :role, :phone, :gender])
  end

  def not_authorize
    redirect_to root_path, notice: "權限不足!!"
  end
end
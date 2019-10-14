class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
  
    I18n.locale = session[:locale] || I18n.default_locale
  end
  
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :not_authorize

  private

  def after_sign_in_path_for(resource)
    return stored_location_for(resource) || '/' if @user == nil
    return stored_location_for(resource) || admin_root_path if @user.role == "管理者"
    return stored_location_for(resource) || staff_root_path if @user.role == "職員"
    return stored_location_for(resource) || student_root_path if @user.role == "學生"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:number, :name, :role, :phone, :gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :number, :name, :role, :phone, :gender])
  end

  def not_authorize
    redirect_to '/', notice: "權限不足!!"
  end
end
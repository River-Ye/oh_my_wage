module Staff::UsersHelper
  def without_department
    # staff/users/home
    if @department.nil?
      t("welcome", name: @current_user.name)
    else
      t("welcome2", name: @current_user.name, apartment: @department.name)
    end
  end
end
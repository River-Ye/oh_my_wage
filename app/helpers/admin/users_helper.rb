module Admin::UsersHelper
  def user_department
    if @user.departments.map{ |x| x.name }.empty? && @user.role == '管理者'
      "管理部"
    elsif @user.departments.map{ |x| x.name }.empty?
      "沒有隸屬任何單位"
    else
      @user.departments.map{ |x| x.name }.uniq.join("、")
    end
  end
end
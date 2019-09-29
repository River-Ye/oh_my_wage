class Staff::UsersController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:show, :history]

  def index 
    # 找出登入老師的所屬部門代號
    department_id = DepartmentWithUser.find_by(user_id: current_user.id)[:department_id]
    # 找出該部門底下所有人
    department_user_id = DepartmentWithUser.where(department_id: department_id).map{ |x| x.user_id }
    user_section = [*1..User.all.count] - department_user_id
    # 顯示非該部門學生 id
    @students = User.where(id: user_section).where(role: 2).order(name: :asc).page(params[:page])
  end

  def show
  end

  def home
  end

  def update
    # 找出老師所屬單位
    department_id = DepartmentWithUser.find_by(user_id: current_user.id)[:department_id]
    @departmentwithuser = DepartmentWithUser.new(user_id: User.find(params[:id]).id, department_id: department_id)
    if @departmentwithuser.save
      redirect_to staff_users_path, notice: "已新增至 #{Department.find(department_id).name} 該部門"
    else
      redirect_to staff_users_path, notice: "新增失敗，請與管理者聯絡!!"
    end
  end

  private

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
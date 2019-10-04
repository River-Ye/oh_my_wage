class Staff::UsersController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:show, :update]

  def index
    if DepartmentWithUser.find_by(user_id: current_user.id).nil?
      redirect_to root_path, notice: "不隸屬任何部門喔，請向管理者反映!!"
    else
      @students = User.where(id: user_section).where(role: 2).search(params[:search]).order(name: :asc).page(params[:page])
    end
  end

  def show
  end
  

  def home
  end

  def update
    @departmentwithuser = DepartmentWithUser.new(user_id: @student.id, department_id: department_id)
    if @departmentwithuser.save
      redirect_to staff_users_path, notice: "已新增至 #{Department.find(department_id).name} 該部門"
    else
      redirect_to staff_users_path, notice: "新增失敗，請與管理者聯絡!!"
    end
  end

  private

  def find_student
    @student = User.friendly.find(params[:id])
  end

  def department_id
    # 找出登入老師的所屬部門代號
    DepartmentWithUser.find_by(user_id: current_user.id)[:department_id]
  end

  def user_section
    department_user_id = DepartmentWithUser.where(department_id: department_id).map{ |x| x.user_id }
    [*1..User.all.count] - department_user_id
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
class Staff::UsersController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:show, :update]

  def index
    if DepartmentWithUser.find_by(user_id: current_user.id).nil?
      redirect_to '/', notice: "不隸屬任何部門喔，請向管理者反映!!"
    else
      @students = User.where(id: user_section).staff_order.search(params[:search]).page(params[:page])
    end
  end

  def show
  end
  

  def home
  end

  def update
    @departmentwithuser = DepartmentWithUser.new(user_id: @student.id, department_id: department_id.id)
    if @departmentwithuser.save
      redirect_to staff_users_path, notice: "已新增 #{@student.name} 至 #{department_id.name} 該部門"
    else
      redirect_to staff_users_path, notice: "新增失敗，請與管理者聯絡!!"
    end
  end

  private

  def find_student
    @student = User.friendly.find(params[:id])
  end

  def department_id
    current_user.departments[0]
  end

  def user_section
    [*1..User.all.count] - department_id.users.ids
  end

  def check_login
    redirect_to '/', notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
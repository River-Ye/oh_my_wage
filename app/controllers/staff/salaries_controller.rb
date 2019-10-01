class Staff::SalariesController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:edit, :update, :destroy]
  before_action :find_student_salary, only: [:show, :update, :destroy]
  before_action :find_student_salary_all, only: [:show]

  def index
    
    if DepartmentWithUser.find_by(user_id: current_user.id).nil?
      redirect_to root_path, notice: "不隸屬任何部門喔，請向管理者反映!!"
    else
      # 找出登入老師的所屬部門代號
      @department_id = DepartmentWithUser.find_by(user_id: current_user.id)[:department_id]
      # 找出該部門底下所有人
      user_id = DepartmentWithUser.where(department_id: @department_id).map{|x| x.user_id}
      # 找出該部門下的學生
      @students = User.where(id: user_id).where(role: 2).search(params[:search]).order(name: :asc).page(params[:page])
      respond_to do |format|
        format.html
        format.json
        format.pdf { render template: 'users/pdf',pdf:'pdf' }
      end
    end
  end

  def show
  end
  
  def pdf
    render html: params(@salary)
    if DepartmentWithUser.find_by(user_id: current_user.id).nil?
      redirect_to root_path, notice: "不隸屬任何部門喔，請向管理者反映!!"
    else
      # 找出登入老師的所屬部門代號
      @department_id = DepartmentWithUser.find_by(user_id: current_user.id)[:department_id]
      # 找出該部門底下所有人
      user_id = DepartmentWithUser.where(department_id: @department_id).map{|x| x.user_id}
      # 找出該部門下的學生
      @students = User.where(id: user_id).where(role: 2).order(name: :asc).page(params[:page])
    end
  end


  def edit
    @student.salaries.build if @student.salaries.empty?
  end

  def update
    if @student.update(salary_edit_params)
      redirect_to staff_salaries_path, notice: "更新成功!!"
    else
      render :edit
    end
  end

  def destroy
    # 找出登入老師的所屬部門代號
    department_id = DepartmentWithUser.find_by(user_id: current_user.id)[:department_id]
    # 找出該部門底下該學生
    out = DepartmentWithUser.where(department_id: department_id).where(user_id: params[:id]).ids
    DepartmentWithUser.delete(out)
    redirect_to staff_salaries_path, notice: "已從 #{Department.find(department_id).name} 剔除!!"
  end

  private
  
  def find_student
    # index 用到
    @student = User.find(params[:id])
  end

  def find_student_salary
    # show 用到
    @user = Salary.find_by(user_id: params[:id])
  end

  def find_student_salary_all
    # show 用到
    if @user.nil?
      redirect_to staff_salaries_path, notice: "目前沒有資料"
    else
      @salary_all = Salary.where(user_id: @user.user_id).order(date: :desc)
    end
  end

  def salary_edit_params
    # edit 編輯薪水
    params.require(:user).permit(salaries_attributes: [:id, :user_id, :date, :hr, :hourly_wage, :_destroy])
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
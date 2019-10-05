class Staff::SalariesController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :find_when_monthly_salary, only: [:index]

  def index
    if DepartmentWithUser.find_by(user_id: current_user.id).nil?
      redirect_to '/', notice: "不隸屬任何部門喔，請向管理者反映!!"
    else
      @students = staff_department.users.staff_order.search(params[:search]).page(params[:page])
    end
  end

  def show
    @salary = Salary.find_by(user_id: @student)
    if @salary.nil?
      redirect_to staff_salaries_path, notice: "目前沒有資料"
    else
      @salary_all = Salary.where(user_id: @salary.user_id).order(date: :desc)
      respond_to do |format|
        format.html
        format.json
        format.pdf{ render template:'staff/salaries/pdf',pdf:'pdf' }
      end
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
    out = DepartmentWithUser.where(department_id: staff_department).where(user_id: @student)
    DepartmentWithUser.delete(out)
    redirect_to staff_salaries_path, notice: "#{@student.name} 已從 #{staff_department.name} 剔除!!"
  end

  private
  
  def find_student
    @student = User.friendly.find(params[:id])
  end

  def find_when_monthly_salary
    beginning_of_month = Date.today.beginning_of_month
    end_of_month = beginning_of_month.end_of_month
    @between_month = beginning_of_month..end_of_month
  end

  def staff_department
    @department = current_user.departments[0]
  end

  def salary_edit_params
    params.require(:user).permit(salaries_attributes: [:id, :user_id, :date, :hr, :hourly_wage, :_destroy])
  end

  def check_login
    redirect_to '/', notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
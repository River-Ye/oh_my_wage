class Staff::SalariesController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :find_when_monthly_salary, only: [:index,:pdf]

  def index
    if DepartmentWithUser.find_by(user_id: current_user.id).nil?
      redirect_to '/', notice: "不隸屬任何部門喔，請向管理者反映!!"
    else
      # 原本寫法
      @students = staff_department.users.includes(:salaries).student_order.search(params[:search]).page(params[:page])
    
      # KT 寫法
      # @students = User.includes(:departments).without_department(staff_department).student_order.search(params[:search]).page(params[:page])
      # byebug
      # student_ids = @students.map(&:id)
      # @salaries_this_month = Salary.this_month.where(user_id: student_ids).group(:user_id).pluck(:user_id, 'SUM(hr)', 'SUM(hourly_wage * hr)').reduce({}) do |rs, salary|
      #   rs.merge!(salary[0].to_i => { hr: salary[1], wage: salary[2] })
      # end 
    end
  end

  def show
    @salary = Salary.find_by(user_id: @student)
    if @salary.nil?
      redirect_to staff_salaries_path, notice: "目前沒有資料"
    else
      @salary_all = Salary.where(user_id: @salary.user_id).order(date: :desc)
      
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
    out = DepartmentWithUser.where(department_id: staff_department, user_id: @student)
    DepartmentWithUser.delete(out)
    redirect_to staff_salaries_path, notice: "#{@student.name} 已從 #{staff_department.name} 剔除!!"
  end

  def pdf
    @students = staff_department.users.includes(:salaries).student_order.search(params[:search])
    respond_to do |format|
      format.html
      format.json
      format.pdf{ 
        render template:'staff/salaries/pdf',
        pdf:'pdf',
        orientation: 'Landscape',
        :encoding => "UTF-8" }
    end

  end

  private
  
  def find_student
    if staff_department.users.where(slug: params[:id]).empty?
      redirect_to staff_salaries_path, notice: "沒有這個人喔!!"
    else
      @student = staff_department.users.friendly.find(params[:id])
    end
  end

  def find_when_monthly_salary
    beginning_of_month = Date.today.beginning_of_month.beginning_of_day
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
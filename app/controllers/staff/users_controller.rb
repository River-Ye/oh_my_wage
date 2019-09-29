class Staff::UsersController < ApplicationController
  before_action :check_login
  before_action :find_student, only: [:show, :history]

  def index
    @students = User.where(role: 2).order(name: :asc).page(params[:page])
  end

  def show
  end

  def new
  end

  def history
    @issue = ReplyToIssue.all
  end

  def home
  end

  def create
    @reply_to_issue = ReplyToIssue.new(reply_to_issue_params)
    if @reply_to_issue.save
      redirect_to student_path(current_user), notice: "已收到問題囉"
    else
      render :problem
    end
  end

  def edit
    departmnet_with_user = DepartmentWithUser.where(department_id: current_user.id)
    user_id = departmnet_with_user.map { |student| student[:user_id] }
    @students = User.where(id: user_id).where(role: 1)
  end

  private

  def find_student
    @student = User.find(params[:id])
  end

  def reply_to_issue_params
    params.require(:reply_to_issue).permit(:title, :content, salaries_attributes: [:id, :title, :content])
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
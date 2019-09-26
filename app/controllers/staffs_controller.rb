class StaffsController < ApplicationController
  before_action :check_login
  before_action :find_salary, only: [:show, :history]

  def show
  end

  def new
  end

  def history
    @student = User.where(subject: '葛來分多')
    @issue = ReplyToIssue.all
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
    # byebug
    @student = User.where(subject: current_user.subject)
    # Department.where(name: current_user.subject)
  end

  private

  def find_salary
    @salary = current_user.salaries
  end

  def reply_to_issue_params
    params.require(:reply_to_issue).permit(:title, :content, salaries_attributes: [:id, :title, :content])
  end

  def check_login
    redirect_to root_path, notice: "權限不足!!" unless user_signed_in? && current_user.role == 'staff'
  end
end
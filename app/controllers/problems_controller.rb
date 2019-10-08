class ProblemsController < ApplicationController
  before_action :check_login

  def index
    @problems = ReplyToIssue.order(title: :asc).page(params[:page])
    authorize @problems
  end

  def new
    @reply_to_issue = ReplyToIssue.new
    authorize @reply_to_issue
  end

  def create
    @reply_to_issue = current_user.reply_to_issues.new(reply_to_issue_params)
    if @reply_to_issue.save
      redirect_to '/', notice: "已收到問題囉"
    else
      render :new
    end
  end

  private

  def find_reply_to_issue
    @reply_to_issue = ReplyToIssue.find_by(id: params[:id])
  end
  
  def reply_to_issue_params
    params.require(:reply_to_issue).permit(:title, :content)
  end

  def check_login
    redirect_to '/', notice: "請先登入!!" unless user_signed_in?
  end
end
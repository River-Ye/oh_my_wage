class ProblemsController < ApplicationController
  # 是否需要讓學生看到提問的歷史紀錄
  def index
    @problems = ReplyToIssue.order(role: :asc).page(params[:page])
  end

  def show
  end

  def new
    @reply_to_issue = ReplyToIssue.new
  end

  def create
    @reply_to_issue = current_user.reply_to_issues.new(reply_to_issue_params)
    if @reply_to_issue.save
      redirect_to root_path, notice: "已收到問題囉"
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
end
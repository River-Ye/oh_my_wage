class ReplyToIssuePolicy
  attr_reader :user, :reply_to_issue

  def initialize(user, problem)
    @user = user
    @problems = problem
  end

  def index?
    return false if user.nil?
    user.role == '管理者'
  end

  def new?
    user.role?
  end

  def update?
  end
end
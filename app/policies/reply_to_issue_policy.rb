class ReplyToIssuePolicy
  attr_reader :user, :reply_to_issue

  def initialize(user, problem)
    @user = user
    @problems = problem
  end

  def index?
    return false if user.nil?
    user.admin?
  end

  def new?
    user.role?
  end

  def update?
    # user.student? or not candidate.published?
  end
end
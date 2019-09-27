class PostPolicy
  attr_reader :user, :studnet

  def initialize(user, studnet)
    @user = user
    @studnet = studnet
  end

  def new?
    user.role == 'student'
  end

  def update?
    # user.student? or not candidate.published?
  end
end
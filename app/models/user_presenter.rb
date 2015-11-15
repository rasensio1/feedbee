class UserPresenter < SimpleDelegator
  attr_reader :user
  
  def initialize(user)
    super
    @user = user
  end

  def follows
    user.user_follows.map(&:followable)
  end

  def votes_count
    user.votes.count
  end
end

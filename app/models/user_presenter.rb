class UserPresenter < SimpleDelegator
  attr_reader :user
  
  def initialize(user)
    super
    @user = user
  end

  def follows
    Place.joins(:user_follows).where("user_follows.user_id" => user.id)
  end

  def votes_count
    user.votes.count
  end
end

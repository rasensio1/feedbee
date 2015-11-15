class UserPresenter < SimpleDelegator
  attr_reader :user, :votes_count
  
  def initialize(user)
    super
    @user = user
    @votes_count = get_votes
  end

  def follows
    Place.joins(:user_follows).where("user_follows.user_id" => user.id)
  end

  def rank
    UserRank.rank(votes_count)
  end

  def get_votes 
    user.votes.count
  end
end

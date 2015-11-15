class UsersController < ApplicationController
  def show
    @user = current_user
    @follows = current_user.user_follows
    @votes = current_user.votes.count
  end
end

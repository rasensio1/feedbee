class UsersController < ApplicationController

  def show
    @user = current_user
    @follows = current_user.user_follows
  end
end

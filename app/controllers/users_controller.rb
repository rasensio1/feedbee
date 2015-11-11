class UsersController < ApplicationController

  def show
    @follows = current_user.user_follows
    byebug
  end
end

class UsersController < ApplicationController

  def show
    @follows = current_user.user_follows
  end
end

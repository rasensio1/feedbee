class UsersController < ApplicationController
  def show
    @user_presenter = UserPresenter.new(current_user)
  end
end

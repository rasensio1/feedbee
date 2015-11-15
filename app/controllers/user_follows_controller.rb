class UserFollowsController < ApplicationController

  def create
    FollowChanger.create(current_user, params["url"])
    render json: "Success"
  end

  def show
    render json: current_user.places.pluck(:slug).include?(slug)
  end

  def destroy
    FollowChanger.destroy(current_user, params["url"])
    render json: "Success"
  end
end

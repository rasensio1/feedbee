class UserFollowsController < ApplicationController

  def create
    FollowManager.create(current_user, params["url"])
    render json: "Success"
  end

  def show
    render json: FollowManager.is_following?(current_user, params["url"])
  end

  def destroy
    FollowManager.destroy(current_user, params["url"])
    render json: "Success"
  end

  private

  def slug
    follow_params.last
  end

  def follow_params
    params["url"].split("/")
  end
end

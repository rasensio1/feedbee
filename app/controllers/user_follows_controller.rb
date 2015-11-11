class UserFollowsController < ApplicationController

  def create
    UserFollow.create(user_id: current_user.id,
                     followable_id: followable_id,
                     followable_type: type)
    render json: "Success"
  end

  def show
    render json: current_user.places.pluck(:slug).include?(slug)
  end

  private
  def type
    follow_params.fourth.singularize.capitalize
  end

  def followable_id
    Place.find_by(slug: slug).id
  end

  def slug
    follow_params.last
  end

  def follow_params
    params["url"].split("/")
  end
end

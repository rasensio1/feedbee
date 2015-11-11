class UserFollowsController < ApplicationController

  def create
    UserFollow.create(user_id: current_user.id,
                     followable_id: followable_id,
                     followable_type: type)
    render json: "Success"
  end

  def type
    follow_params.fourth.singularize.capitalize
  end

  def followable_id
    slug = follow_params.last
    Place.find_by(slug: slug).id
  end

  def follow_params
    params["url"].split("/")
  end
end

class VotesController < ApplicationController
  before_action :require_current_user

  def create
    Vote.create(user_id: current_user.id,
                value: value,
                comment_id: comment_id)
    render json: true
  end

  def value
    params["value"]
  end

  def comment_id
    params["comment_id"]
  end
end

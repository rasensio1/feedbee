class VotesController < ApplicationController
  before_action :require_current_user

  def create
    Vote.destroy_old_vote(current_user, comment_id)
    Vote.create_new_vote(current_user, comment_id, value)
    render json: true
  end

  private

  def value
    params["value"]
  end

  def comment_id
    params["comment_id"]
  end

end

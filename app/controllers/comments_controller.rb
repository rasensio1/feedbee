class CommentsController < ApplicationController
  before_action :require_current_user, only: [:create]

  def create
    Comment.create(comment_params).create_first_vote(current_user)
    flash[:success] = "Comment Saved"
    redirect_to :back
  end

  def index
    render json: Comment.for_a_place(current_place)
  end

  private

  def comment_params
    format_params.require(:comment).permit(:body,
                                    :commentable_id,
                                    :commentable_type,
                                    :sentiment)
  end

  def format_params
    params[:comment][:sentiment] = params[:comment][:sentiment].to_i
    params
  end

  def slug
    params["url"].split("/").last
  end

  def current_place
    Place.find_by(slug: slug)
  end
end

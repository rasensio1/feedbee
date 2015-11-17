class CommentsController < ApplicationController
  before_action :require_current_user, only: [:create]

  def create
    CommentCreator.go(comment_params, current_user)
    flash["message"] = "Comment Saved!"
    redirect_to :back
  end

  def destory
    CommentCreator.destory_last_comment(current_user)
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

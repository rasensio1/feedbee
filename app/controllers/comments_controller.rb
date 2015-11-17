class CommentsController < ApplicationController
  before_action :require_current_user, only: [:create]

  def create
    CommentCreator.go(comment_params, current_user)
    flash["message"] = "Comment Saved!"
    redirect_to :back
  end

  def destroy
    if current_user.last_comment_has_votes?
      flash["message"] = "Can't delete a comment that others have already voted on!"
    else
      CommentCreator.destory_last_comment(current_user)
      flash["message"] = "Comment destroyed."
    end
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

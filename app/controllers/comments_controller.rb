class CommentsController < ApplicationController
  before_action :require_current_user, only: [:create]

  def create
    comment = Comment.new(comment_params)
    comment.save
    Vote.create(user_id: current_user.id, comment_id: comment.id, value: 1)

    flash[:success] = "Comment Saved"
    redirect_to :back
  end

  def index
    render json: Comment.for_a_place(current_place)
  end

  def comment_params
    format_params.require(:comment).permit(:body,
                                    :commentable_id,
                                    :commentable_type,
                                    :sentiment)
  end

  private
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

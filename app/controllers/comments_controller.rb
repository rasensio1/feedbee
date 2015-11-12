class CommentsController < ApplicationController
  helper_method :votes
  def create
    comment = Comment.new(comment_params)
    comment.save
    flash[:success] = "Comment Saved"
    redirect_to :back
  end

  def index
    byebug
    render json: "Hello"
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
end

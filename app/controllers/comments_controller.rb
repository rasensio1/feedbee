class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    flash[:success] = "Comment Saved"
    redirect_to :back
  end

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
end

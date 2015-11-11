class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.save
    flash[:success] = "Comment Saved"
    redirect_to :back
  end
end

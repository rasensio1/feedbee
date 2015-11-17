class CommentCreator
  def self.go(comment_params, current_user)
    comment = Comment.create(comment_params)
    create_dependencies(comment, current_user)
  end

  def self.create_dependencies(comment, user)
    Vote.create(user_id: user.id, comment_id: comment.id, value: 1)
  end

  def self.destory_last_comment(user)
    vote = Vote.where(user_id: user.id).order(created_at: :desc).limit(1).first
    comment_id = vote.comment_id
    vote.delete
    Comment.find(comment_id).delete
  end
end

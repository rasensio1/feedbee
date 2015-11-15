class CommentCreator
  def self.go(comment_params, current_user)
    comment = Comment.create(comment_params)
    create_dependencies(comment, current_user)
  end

  def self.create_dependencies(comment, current_user)
    Vote.create(user_id: current_user.id, comment_id: comment.id, value: 1)
  end
end

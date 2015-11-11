require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "is valid" do
    assert create_comment.valid?
  end

  test "is invalid without body" do
    comment = create_comment
    comment.body = nil
    refute comment.valid?
  end

  test "is invalid without sentiment" do
    comment = create_comment
    comment.sentiment = nil
    refute comment.valid?
  end

  test "is valid is invalid without followable_id" do
    comment = create_comment
    comment.followable_id = nil
    refute comment.valid?
  end

  test "is valid is invalid without followable_type" do
    comment = create_comment
    comment.followable_type = nil
    refute comment.valid?
  end

  def create_comment
    Comment.new(body: "IM THE BODY", 
                sentiment: 0, 
                followable_id: 1, 
                followable_type: "Place")
  end
end

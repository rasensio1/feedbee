require 'rails_helper' 
describe Comment do

  it "is valid" do
    assert create_comment.valid?
  end

  it "is invalid without body" do
    comment = create_comment
    comment.body = nil
    refute comment.valid?
  end

  it "is invalid without sentiment" do
    comment = create_comment
    comment.sentiment = nil
    refute comment.valid?
  end

  it "is valid is invalid without commentable_id" do
    comment = create_comment
    comment.commentable_id = nil
    refute comment.valid?
  end

  it "is valid is invalid without commentable_type" do
    comment = create_comment
    comment.commentable_type = nil
    refute comment.valid?
  end

  def create_comment
    Comment.new(body: "IM THE BODY", 
                sentiment: 0, 
                commentable_id: 1, 
                commentable_type: "Place")
  end
end

class Comment < ActiveRecord::Base
  validates :body,
    :sentiment,
    :commentable_id,
    :commentable_type, presence: true
  enum sentiment: [:negative, :positive]

  belongs_to :commentable, polymorphic: true
  belongs_to :place, -> { where(comments: {commentable_type: 'Place'}) }, foreign_key: 'commentable_id'
  has_many :votes

end

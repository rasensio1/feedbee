class Comment < ActiveRecord::Base
  validates :body,
    :sentiment,
    :commentable_id,
    :commentable_type, presence: true
  enum sentiment: [:negative, :positive]

  belongs_to :commentable, polymorphic: true
  belongs_to :place, -> { where(comments: {commentable_type: 'Place'}) }, foreign_key: 'commentable_id'
  has_many :votes

  def self.for_a_place(current_place)
     select("comments.*, sum(votes.value) AS vote_count")
     .joins(:votes)
     .joins(:place).where("comments.commentable_id" => current_place.id)
     .group("comments.id")
     .order("vote_count DESC")
  end
end

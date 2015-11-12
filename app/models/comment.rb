class Comment < ActiveRecord::Base
  validates :body, 
    :sentiment, 
    :commentable_id, 
    :commentable_type, presence: true

  enum sentiment: [ :negative, :positive ]
end

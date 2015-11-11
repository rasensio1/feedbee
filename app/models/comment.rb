class Comment < ActiveRecord::Base
  validates :body, 
    :sentiment, 
    :commentable_id, 
    :commentable_type, presence: true
end

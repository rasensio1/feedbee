class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  validates :user_id, :comment_id, :value, presence: true
end

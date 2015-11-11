class UserFollow < ActiveRecord::Base
  belongs_to :followable, polymorphic: true
  belongs_to :user, foreign_key: "user_id"
end

class UserFollow < ActiveRecord::Base
  belongs_to :followable, polymorphic: true
  belongs_to :user


  validates :user_id, uniqueness: { scope: :followable_id,
        message: "You are already following this page!" }
end

class UserFollow < ActiveRecord::Base
  belongs_to :followable, polymorphic: true
  belongs_to :user
end

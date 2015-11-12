class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment

  validates :user_id, :comment_id, :value, presence: true

  validates :user_id, uniqueness: { scope: :comment_id,
        message: "You are already voted on this, YO" }
  validate :abs_value_one

  def abs_value_one
    if value != 1 && value != -1
      errors.add(:value, "Whatchu trying to do??")
    end
  end
end

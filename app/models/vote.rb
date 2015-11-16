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

  def self.for_a_comment(comment)
    where(comment_id: comment.id).sum(:value)
  end

  def self.destroy_old_vote(user, comment_id)
    Vote.where(user_id: user.id).where(comment_id: comment_id).destroy_all
  end

  def self.create_new_vote(user, comment_id, value)
    Vote.create(user_id: user.id,
                value: value,
                comment_id: comment_id)
  end
end

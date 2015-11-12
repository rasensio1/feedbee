require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "is valid" do
    assert new_vote.valid?
  end

  test "is invalid without user_id" do
    vote = new_vote
    vote.user_id = nil

    refute vote.valid?
  end

  test "is invalid without comment_id" do
    vote = new_vote
    vote.comment_id = nil

    refute vote.valid?
  end

  test "is invalid without value" do
    vote = new_vote
    vote.value = nil

    refute vote.valid?
  end

  test "is must have value as 1 or -1" do
    vote = new_vote

    vote.value = 2
    refute vote.valid?

    vote.value = -2
    refute vote.valid?
  end

  def new_vote
    Vote.new(user_id: 1,
             comment_id: 2,
             value: 1)
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def new_user
    User.new(email: "Ryan@yeah.com",
             uid: "123abc",
             name: "Ryan Asensio",
             oauth_token: "xxx11")
  end

  test "is valid" do
    assert new_user.valid?
  end

  test "is invalid without uid" do
    user = new_user
    user.uid = nil

    refute user.valid?
  end

  test "is invalid without name" do
    user = new_user
    user.name = nil

    refute user.valid?
  end

  test "can follow something" do
    turing = create_turing
    user = new_user

    user.user_follows << UserFollow.new(followable_type: "Place", followable_id: turing.id)

    assert_equal "Turing School", user.user_follows.first.followable.name
  end
end

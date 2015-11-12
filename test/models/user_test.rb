require 'test_helper'

class UserTest < ActiveSupport::TestCase
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
    user.user_follows << UserFollow.create(followable_type: "Place", followable_id: turing.id)

    assert_equal "Turing School", user.user_follows.first.followable.name
  end

  test "cant double follow something" do
    turing = create_turing
    user = new_user
    user.save

    UserFollow.create(user_id: user.id, followable_type: "Place", followable_id: turing.id)
    uf2 = UserFollow.new(user_id: user.id, followable_type: "Place", followable_id: turing.id)

    refute uf2.valid?
  end

  test "cant double vote something" do
    turing = create_turing
    comment = Comment.create(body: "VOTE ON ME",
                   sentiment: 1,
                   commentable_id: turing.id,
                   commentable_type: "Place")

    user = new_user
    user.save

    Vote.create(user_id: user.id, comment_id: comment.id, value: 1)
    second = Vote.new(user_id: user.id, comment_id: comment.id, value: -1)

    refute second.valid?
  end

  def create_turing
    turing = Place.create(
      name: "Turing School",
      place_id: "abc123",
      image_url: "www.dono.com",
      rating: "3",
      phone_no: "(303) 421-2345",
      website: "turing.io",
      hours: "PEOPLE ARE ALWAYS HERE" 
    )
    Address.create(place_id: turing.id)
    turing
  end

  def new_user
    User.new(email: "Ryan@yeah.com",
             uid: "123abc",
             name: "Ryan Asensio",
             oauth_token: "xxx11")
  end

end

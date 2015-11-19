require 'rails_helper'
describe CommentCreator do

  it "#destory_last_comment" do
    comment = create_comment
    user = create_user
    CommentCreator.create_dependencies(comment, user)

    expect(Comment.count).to eq(1)
    expect(Vote.count).to eq(1)

    CommentCreator.destory_last_comment(user)

    expect(Comment.count).to eq(0)
    expect(Vote.count).to eq(0)
  end

  def create_user
    User.create(email: "Ryan@yeah.com",
             uid: "123abc",
             name: "Ryan Asensio",
             oauth_token: "xxx11")
  end

  def create_comment
    turing = create_turing
    Comment.create(body: "oh yeah", sentiment: 0,
                   commentable_id: turing.id,
                   commentable_type: "Place")

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
end

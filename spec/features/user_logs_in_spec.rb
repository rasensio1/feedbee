require 'rails_helper'

RSpec.feature 'logging in and out' do
  it "works" do
    stub_omniauth
    login_user
    assert_equal '/', current_path
    assert page.has_content?("Ryan Asensio")

    click_link "Log Out"
    assert_equal '/', current_path
    refute page.has_content?("Ryan Asensio")
  end

  it "renders error with bad response", js: true do
    UserFollowsController.any_instance.stub(:current_user).
      and_return(User.first)
    PlacesController.any_instance.stub(:current_place).
      and_return(Place.first)
    UsersController.any_instance.stub(:current_user).
      and_return(User.first)
    Comment.stub(:for_a_place).
      and_return(nil)
    FollowManager.stub(:is_following?).and_return(true)
    stub_bad_omniauth
    login_user
    assert_equal '/', current_path
    refute page.has_content?("Ryan Asensio")
  end
end

require 'rails_helper'
RSpec.feature 'following a place' do

  describe "a user", :js => true do
    before(:each) do
      create_place
      create_user
      UserFollowsController.any_instance.stub(:current_user).
        and_return(User.first)
      UsersController.any_instance.stub(:current_user).
        and_return(User.first)
      PlacesController.any_instance.stub(:current_place).
        and_return(Place.first)
      CommentsController.any_instance.stub(:current_place).
        and_return(Place.first)
      FollowManager.stub(:followable_id).and_return(Place.first.id)
    end

    it "follows a place" do
      VCR.use_cassette("follow") do
        visit '/'
        visit "/places/#{Place.last.slug}"

        click_on("follow")
        expect(page).to have_content("Following")

        visit profile_path
        assert page.has_content?("turing school")
      end
    end

    it "can unfollow a place" do
      VCR.use_cassette("follow") do
        visit '/'
        visit "/places/#{Place.last.slug}"

        click_on("follow")
        expect(page).to have_content("Following")

        click_on("Following")
        expect(page).to have_content("Follow")

        visit profile_path
        expect(page).to_not have_content("turing school")
      end
    end
  end
end

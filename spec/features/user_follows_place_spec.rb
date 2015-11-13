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
      CommentsController.any_instance.stub(:current_place).
        and_return(Place.first)
    end

    it "follows a place" do
      VCR.use_cassette("follow") do
        visit '/'
        visit '/places/turing-school-of-software-design'

        click_on("follow")
        expect(page).to have_content("Following")

        visit profile_path
        assert page.has_content?("turing school")
      end
    end
  end
end
require 'rails_helper'
RSpec.feature 'searching for a place' do
  describe "a user searches with ambiguous text", :js => true do
    it "returns multiple matches" do
      FollowManager.stub(:is_following?).and_return(false)
      Comment.stub(:for_a_place).and_return(nil)

      VCR.use_cassette("multiple results") do
        visit "/"

        page.fill_in 'nav-search',
          :with => 'fresh '

        click_button "Go"

        expect(current_path).to eq('/search')

        expect(page).to have_content("Freshcraft")
        expect(page).to have_content("Healthy")
      end
    end
  end
end

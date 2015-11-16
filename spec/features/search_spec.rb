require 'rails_helper'
RSpec.feature 'searching for a place' do
  describe "a user searches with ambiguous text", :js => true do
    it "returns multiple matches" do
      VCR.use_cassette("multiple results") do
        visit "/"

        page.fill_in 'nav-search',
          :with => 'turing sc'

        click_button "Go"

        assert_equal 'search', current_path

        assert page.has_content?("Turing School")
        assert page.has_content?("Turing Software")
      end
    end
  end
end

require "test_helper"
class UserVisitsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL
  require 'vcr'
  require 'webmock'

  test "with no previous entry" do
    VCR.use_cassette("new place") do
      visit "/"

      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'

      click_button "Go"

      assert_equal '/places/turing-school-of-software-design', 
        current_path

      assert page.has_content?("Turing School of Software & Design")
      assert page.has_content?("1510")
      assert page.has_content?("Denver")
    end
  end

  test "with previous entry" do
    VCR.use_cassette("existing place") do
      visit "/"

      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'

      click_button "Go"

      visit "/"

      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'
      click_button "Go"

      assert_equal 1, Place.count
    end
  end

  test "can comment" do
    VCR.use_cassette("new place") do
      login_create_place

      page.fill_in 'input-comment', 
        :with => 'The food is bad'

      within("#comment-form") do
        click_on "Submit"
      end

      visit current_path

      assert page.has_content?("The food is bad")
    end
  end
end

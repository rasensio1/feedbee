require "test_helper"
class UserVisitsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL

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

  test "follows a place" do
    VCR.use_cassette("follow place") do
      Capybara.current_driver = :selenium

      turing = create_turing
      visit place_path(turing.slug)
      click_on("follow")
      visit profile_path

      assert page.has_content("Turing School")
      Capybara.use_default_driver
    end
  end
end

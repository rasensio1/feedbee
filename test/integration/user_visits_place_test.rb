require "test_helper"
class UserVisitsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL
  require 'vcr'
  require 'webmock'

  test "with previous entry" do
    Capybara.use_default_driver
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

end

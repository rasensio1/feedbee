require "test_helper"
class UserFollowsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL
  require 'vcr'
  require 'webmock'

  test "follows a place" do
    skip
    Capybara.current_driver = Capybara.javascript_driver
    VCR.use_cassette("follow3") do
      login_user
      click_link "Log In with Facebook"
      visit "/"
      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'

      click_button "Go"
      click_on("follow")
      visit profile_path

      assert page.has_content?("Turing School")
    end
    Capybara.use_default_driver
  end

  test "sees 'following' button when following a place" do
    skip
    Capybara.current_driver = Capybara.javascript_driver
    VCR.use_cassette("following") do
      login_user
      visit "/"
      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'

      click_button "Go"
      click_on("follow")
      assert page.has_content?("following")
    end
    Capybara.use_default_driver
  end
end

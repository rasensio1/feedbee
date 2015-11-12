require "test_helper"
class UserFollowsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL
  require 'vcr'
  require 'webmock'

  test "follows a place" do
    skip
    Capybara.current_driver = Capybara.javascript_driver
    user = create_user
    place = create_place

    UserFollowsController.stub_any_instance(:current_user, user) do
    CommentsController.stub_any_instance(:current_place, place) do
      VCR.use_cassette("follow") do
        visit '/'
        click_link "Log In with Facebook"

        visit '/places/turing-school-of-software-design'

        click_on("follow")
        visit profile_path

        assert page.has_content?("Turing School")
      end
    end
    end
    Capybara.use_default_driver
  end

  test "sees 'following' button when following a place" do
    skip
    user = create_user
    UserFollowsController.stub_any_instance(:current_user, user) do
      Capybara.current_driver = Capybara.javascript_driver
      VCR.use_cassette("following") do
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
end

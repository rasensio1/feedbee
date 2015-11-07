require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = FeedBee::Application
  end

  test "logging in" do
    visit "/"
    assert_equal 200, page.status_code

    click_link "Log In with Facebook"
    assert_equal '/', current_path 

    assert page.has_content?("Ryan")
    assert page.has_content?("Asensio")
  end
end

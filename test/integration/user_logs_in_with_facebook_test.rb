require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "logging in and out" do
    visit "/"
    assert_equal 200, page.status_code

    click_link "Log In with Facebook"
    assert_equal '/', current_path
    assert page.has_content?("Ryan Asensio")

    click_link "Log Out"
    assert_equal '/', current_path
    refute page.has_content?("Ryan Asensio")
  end
end

require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "logging in and out" do
    login_user
    assert_equal '/', current_path
    assert page.has_content?("Ryan Asensio")

    click_link "Log Out"
    assert_equal '/', current_path
    refute page.has_content?("Ryan Asensio")
  end
end

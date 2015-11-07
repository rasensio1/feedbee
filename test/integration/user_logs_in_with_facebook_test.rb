require "test_helper"
class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = FeedBee::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      provider: 'facebook',
      uid: '123',
      info: {
        name: "Ryan Asensio"
      },
      credentials: {
        oauth_token: "pizza",
      }
    })
  end

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

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  VCR.configure do |config|
    config.cassette_library_dir = "fixtures/cassettes"
    config.hook_into :webmock
  end

  def setup
    DatabaseCleaner.start
    Capybara.app = FeedBee::Application
    stub_omniauth
  end

  def teardown
    DatabaseCleaner.clean
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

  def login_create_place
    login_user
      visit "/"
      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'
      click_button "Go"
  end

  def login_user
    visit "/"
    if page.has_content?("Hello")
      visit profile_path
    else
      click_link "Log In with Facebook"
    end
  end
end

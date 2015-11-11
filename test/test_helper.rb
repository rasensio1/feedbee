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

  def create_turing
    turing = Place.create(
      name: "Turing School",
      place_id: "abc123",
      image_url: "www.dono.com",
      rating: "3",
      phone_no: "(303) 421-2345",
      website: "turing.io",
      hours: "PEOPLE ARE ALWAYS HERE" 
    )
    Address.create(place_id: turing.id)
    turing
  end

  def login_user
    visit "/"
    click_link "Log In with Facebook"
  end
end

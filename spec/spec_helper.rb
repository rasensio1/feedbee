RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

def login_user
  visit "/"
  click_link "Log In with Facebook"
end

def create_place
  Place.create(name: "turing school of software design", place_id: 123)
end

def create_user
  User.create(email: "Ryan@yeah.com",
           uid: "123abc",
           name: "Ryan Asensio",
           oauth_token: "xxx11")
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


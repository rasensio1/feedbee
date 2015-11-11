require "test_helper"
class UserVisitsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL
  require 'vcr'
  require 'webmock'

  test "visist profile page" do
    skip
    VCR.use_cassette("my_profile") do
      login_user

      visit profile_path
      assert page.has_content?("Ryan Asensio")
      assert page.has_content?("Recent Activity")
      assert page.has_content?("Following")
    end
  end

end

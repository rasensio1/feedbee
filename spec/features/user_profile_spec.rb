require 'rails_helper'
RSpec.feature 'user profile' do
  describe "a user" do
    it 'can view their profile' do
      stub_omniauth
      VCR.use_cassette("my_profile") do
        login_user

        visit profile_path
        assert page.has_content?("Ryan Asensio")
        assert page.has_content?("Following")
        assert page.has_content?("My Information")
        assert page.has_content?("Votes")
        assert page.has_content?("Rank")
      end
    end
  end
end

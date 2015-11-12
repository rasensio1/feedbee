require 'rails_helper'

Rspec.feature 'following a place' do

  it "follows a place" do
    VCR.use_cassette("follow") do
      login_user
      visit '/'
      click_link "Log In with Facebook"

      visit '/places/turing-school-of-software-design'

      click_on("follow")
      visit profile_path

      assert page.has_content?("Turing School")
    end
  end

  it "sees 'following' button when following a place" do
    VCR.use_cassette("following") do
      login_user
      visit "/"
      page.fill_in 'nav-search', 
        :with => 'Turing School of Software & Design'

      click_button "Go"
      click_on("follow")
      assert page.has_content?("following")
    end
  end
end

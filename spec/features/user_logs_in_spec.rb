RSpec.feature 'logging in and out' do
  it "works" do
    stub_omniauth
    login_user
    assert_equal '/', current_path
    assert page.has_content?("Ryan Asensio")

    click_link "Log Out"
    assert_equal '/', current_path
    refute page.has_content?("Ryan Asensio")
  end
end

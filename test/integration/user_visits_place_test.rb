require "test_helper"
class UserVisitsPlaceSpec < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "with no previous entry" do
    visit "/"

    page.fill_in 'nav-search', 
      :with => 'Turing School of Software & Design'

    click_button "Go"

    assert_equal '/places/turing-school-of-software-design', 
      current_path

    assert page.has_content?("Turing School of Software & Design")
    assert page.has_content?("1510")
    assert page.has_content?("Denver")
  end
end

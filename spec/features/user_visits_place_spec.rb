require 'rails_helper'

RSpec.feature 'visiting a place' do
  describe "a user", :js => true do

    before(:each) do
      create_place
      create_user
      UserFollowsController.any_instance.stub(:current_user).
        and_return(User.first)
      UsersController.any_instance.stub(:current_user).
        and_return(User.first)
      CommentsController.any_instance.stub(:current_place).
        and_return(Place.first)
    end

    xit "with no previous entry" do
      VCR.use_cassette("existing_place") do
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

    xit "can comment" do
      VCR.use_cassette("new place") do

        visit '/places/turing-school-of-software-design'

        page.fill_in 'input-comment',
          :with => 'The food is bad'

        execute_script("$('#sentiment').val(0)")

        within("#comment-form") do
          click_on "Submit"
        end

        page.fill_in 'input-comment',
          :with => 'The food is bad'

        click_on "Bad"

        visit current_path

        expect(page).to have_content("The food is bad")
      end
    end

    xit"can vote" do

      VCR.use_cassette("can vote") do

        visit current_path

        assert page.has_content?("VOTE ON ME")

        within("div#votes") do
          page.find(:css, '.upvote').click
        end

        assert page.has_content?("VOTE ON ME")
        assert page.has_content?("2")
      end
    end
  end

  describe "that doesn't exist" do

    it 'renders a SORRY page' do
      VCR.use_cassette("nonexistnat place") do
        visit '/'

        page.fill_in 'nav-search',
          :with => 'askljasdf'

        click_button "Go"

        expect(current_path).to eq('/')
        expect(page).to have_content("Sorry")
        expect(page).to have_content("askljasdf")
      end
    end
  end
end

require 'rails_helper' 
RSpec.feature 'visiting a place' do
  describe "a user", :js => true do

    before(:each) do
      stub_omniauth
      create_place
      create_user
      UserFollowsController.any_instance.stub(:current_user).
        and_return(User.first)
      PlacesController.any_instance.stub(:current_place).
        and_return(Place.first)
      UsersController.any_instance.stub(:current_user).
        and_return(User.first)
      Comment.stub(:for_a_place).
        and_return(nil)
    end

    it "with no previous entry" do
      VCR.use_cassette("new") do
        visit "/"

        page.fill_in 'nav-search',
          :with => 'Turing School of Software & Design'

        click_button "Go"

        assert_equal '/places/turing-school-of-software-designChIJFSt998R4bIcR0e3QWNXH9D8',
          current_path

        expect(page).to have_content("turing school of software design")
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

    before(:each) do
      create_place
      create_user
      UserFollowsController.any_instance.stub(:current_user).
        and_return(User.first)
      UsersController.any_instance.stub(:current_user).
        and_return(User.first)
      Comment.stub(:for_a_place).
        and_return("")
    end

    it 'renders a SORRY page' do
      VCR.use_cassette("nope") do
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

  describe "because im an a Capyn00b" do

    before(:each) do
      stub_omniauth
      create_place
      create_user
      UserFollowsController.any_instance.stub(:current_user).
        and_return(User.first)
      PlacesController.any_instance.stub(:current_place).
        and_return(Place.first)
      UsersController.any_instance.stub(:current_user).
        and_return(User.first)
      Comment.stub(:for_a_place).
        and_return(nil)
    end

    it "can comment" do
      VCR.use_cassette("new place") do
        login_user

        visit '/places/turing-school-of-software-design'
        page.fill_in 'input-comment',
          :with => 'The food is bad'

        hidden_field = find :xpath, "//input[@id='sentiment']"
        hidden_field.set "1"

        hidden_field = find :xpath, "//*[@id='comment_commentable_id']"
        hidden_field.set "#{Place.first.id}"

        hidden_field = find :xpath, "//input[@id='comment_commentable_type']"
        hidden_field.set "Place"

        click_on "Submit"

        visit current_path

        expect(Comment.count).to eq(1)
      end
    end

    it "cant comment if not logged in" do
      VCR.use_cassette("new place") do

        visit '/places/turing-school-of-software-design'
        page.fill_in 'input-comment',
          :with => 'The food is bad'

        hidden_field = find :xpath, "//input[@id='sentiment']"
        hidden_field.set "1"

        hidden_field = find :xpath, "//*[@id='comment_commentable_id']"
        hidden_field.set "#{Place.first.id}"

        hidden_field = find :xpath, "//input[@id='comment_commentable_type']"
        hidden_field.set "Place"

        click_on "Submit"

        visit current_path

        expect(Comment.count).to eq(0)
      end
    end
  end
end

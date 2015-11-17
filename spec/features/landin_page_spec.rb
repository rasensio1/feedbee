require 'rails_helper'
RSpec.feature 'landing page' do
  describe 'a user' do
    it 'can see the text' do
      Place.create(name: "turing school of software design", place_id: 123)

      PlacesController.any_instance.stub(:current_place).
        and_return(Place.first)

      visit "/"

      expect(page).to have_content("FeedBee")
      expect(page).to have_content("Check it out!")
      expect(page).to have_content("Help them")

      click_on "Check it out!"
      expect(current_path).to eq("/places/turing-school-of-software-designChIJFSt998R4bIcR0e3QWNXH9D8")
    end
  end
end

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "is valid" do
    place = Place.create(place_id: "abc123", 
                 name: "first one", 
                 image_url: "www.yeah.com", 
                 rating: "3.5", 
                 phone_no: "(539) 374-1838", 
                 website: "www.ohyeah.com",
                 hours: "big formatting stuff")

    assert place.valid?
  end
end

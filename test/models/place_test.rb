require 'test_helper'
class PlaceTest < ActiveSupport::TestCase
  def new_place
    Place.new(place_id: "abc123",
                 name: "first one",
                 image_url: "www.yeah.com",
                 rating: "3.5",
                 phone_no: "(539) 374-1838",
                 website: "www.ohyeah.com",
                 lat: "124.14",
                 lng: "124.14",
                 hours: "big formatting stuff")
  end

  test "is valid" do
    assert new_place.valid?
  end

  test "is invalid without place_id" do
    place = new_place
    place.place_id = nil

    refute place.valid?
  end

  test "is invalid without name" do
    place = new_place
    place.name = nil

    refute place.valid?
  end
end

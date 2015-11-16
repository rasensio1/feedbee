require 'rails_helper'
describe Place do
  it "is valid" do
    assert new_place.valid?
  end

  it "is invalid without place_id" do
    place = new_place
    place.place_id = nil

    refute place.valid?
  end

  it "is invalid without name" do
    place = new_place
    place.name = nil

    refute place.valid?
  end

  it 'can query for its image' do
    VCR.turn_on!
    VCR.use_cassette("find url") do
      id = Place.query_for_id("Paramount Theatre")
      slug = Place.slug_for_show(id)
      place = Place.find_by(slug: slug)

      assert place.photo_url
    end
  end

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
end

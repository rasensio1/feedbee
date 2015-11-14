require 'rails_helper'

describe Place do
  it 'can query for its image' do
    VCR.use_cassette("find url") do
      id = Place.query_for_id("Turing School of Sofwtare & Design")
      slug = Place.slug_for_show(id)
      place = Place.find_by(slug: slug)

      assert place.photo_url
    end
  end
end

class Place < ActiveRecord::Base
  validates :place_id, :name, presence: true

  def self.from_google_api(raw_place)
    place = find_or_create_by(place_id: raw_place.place_id)
    place.update_attributes(
      name: raw_place.name,
      image_url: raw_place.icon,
      rating: raw_place.rating,
      phone_no: raw_place.formatted_phone_number,
      website: raw_place.website,
      hours: raw_place.opening_hours["weekday_text"]
    )

  end
   
end

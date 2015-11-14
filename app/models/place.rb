class Place < ActiveRecord::Base
  before_save :set_slug
  validates :place_id, :name, presence: true

  has_one :address
  has_many :user_follows, as: :followable
  has_many :comments, as: :commentable

  def self.from_google_api(raw_place)
    place = find_or_create_by(place_id: raw_place.place_id)
    hours = raw_place.opening_hours["weekday_text"] rescue nil
    place.update_attributes(
      name: raw_place.name,
      image_url: raw_place.icon,
      rating: raw_place.rating,
      phone_no: raw_place.formatted_phone_number,
      lat: raw_place.lat,
      lng: raw_place.lng,
      photo_url: find_photo_url(raw_place),
      website: raw_place.website,
      hours: hours
    )
    place.update_address(place, raw_place)
    place
  end

  def self.find_photo_url(raw_place)
    raw_place.photos[0].fetch_url(300) rescue nil
  end

  def update_address(place, raw_place)
    Address.update_or_create(place, raw_place)
  end

  def set_slug
    self.slug = name.parameterize
  end

  def self.slug_for_show(place_id)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    raw_place = @client.spot(place_id)
    Place.from_google_api(raw_place).slug
  end

  def self.query_for_id(search_text)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    @client.spots_by_query(search_text).first.place_id rescue nil
  end
end

class Address < ActiveRecord::Base
  belongs_to :place

  def self.update_or_create(place, raw_place)
    if place.address
      place.address.update_attributes(address_params(raw_place))
    else
      place.address = Address.new(address_params(raw_place))
    end

  end

  def self.address_params(raw_place)
    {
    street_no: raw_place.street_number,
    street_name: raw_place.street,
    city: raw_place.city,
    region: raw_place.region,
    postal_code: raw_place.postal_code
    }
  end
end

class Address < ActiveRecord::Base
  belongs_to :place

  def self.update_or_create(place, raw_place)
    if place.address
      place.address = Address.new()
    else
      place.address.update_attributes()
    end

  end
end

require 'rails_helper' 
describe Address do

  it 'is valid' do
    expect(create_address).to be_valid
  end

  it '#update_or_create update' do
    place = new_place
    address = create_address
    create_address.place_id = place.id
    create_address.save

    Address.update_or_create(place, raw_place) 

    expect(place.address.street_no).to eq("456")
  end

  def create_address
    Address.new(street_no: "123", 
                street_name: 0, 
                city: "Lisle", 
                region: "IL", 
                postal_code: "12323", 
                place_id: 1)
  end

  def new_place
    Place.create(place_id: "abc123",
                 name: "first one",
                 image_url: "www.yeah.com",
                 rating: "3.5",
                 phone_no: "(539) 374-1838",
                 website: "www.ohyeah.com",
                 lat: "124.14",
                 lng: "124.14",
                 hours: "big formatting stuff")
  end

  def raw_place
    raw_place = OpenStruct.new
    raw_place.street_number = "456"
    raw_place
  end
end

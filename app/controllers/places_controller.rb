require 'net/https'

class PlacesController < ApplicationController

  def show
    place_id = find_id(params[:go_to])

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.spot(place_id)

    @place = Place.from_goole_api(place_id)

    @name = result.name 
    @image_url = result.icon
    @rating = ""
    @place_id= result.place_id
    @address = ""
    @street_number = result.street_number 
    @street = result.street
    @city = result.city
    @region = result.region
    @postal_code = result.postal_code
    @website = result.website
    @phone_number = result.formatted_phone_number
    @hours = result.opening_hours["weekday_text"]
    render text: result.to_json
  end

  private
  
  def find_id(name)
    if session[:search_memo]
      session[:search_memo][name] || query_for_id(name)
    else
      query_for_id(name)
    end
  end

  def query_for_id(name)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    @client.spots_by_query(name).first.place_id
  end
end

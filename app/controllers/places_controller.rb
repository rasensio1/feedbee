require 'net/https'

class PlacesController < ApplicationController

  def show
    place_id = find_id(params[:go_to])

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    raw_place = @client.spot(place_id)
    @place = Place.from_google_api(raw_place)
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

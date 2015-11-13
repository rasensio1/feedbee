require 'net/https'

class PlacesController < ApplicationController

  def create

    if place_id = find_id(params[:go_to])
      @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
      raw_place = @client.spot(place_id)
      place = Place.from_google_api(raw_place)

      redirect_to place_path(slug: place.slug)
    else
      redirect_to bad_search_path params[:go_to]
    end
  end

  def show
    @place = current_place
    @address = @place.address || Address.new()
    @comment = Comment.new
  end

  private
  
  def find_id(name)
    if session[:search_memo]
      session[:search_memo][name] || query_for_id(name)
    else
      query_for_id(name)
    end
  end

  def current_place
    Place.find_by(slug: params[:slug])
  end

  def query_for_id(name)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    @client.spots_by_query(name).first.place_id rescue nil
  end
end

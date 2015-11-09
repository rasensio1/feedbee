class PlacesController < ApplicationController 

  def show
    byebug
    place_id = find_id(params[:go_to])

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.spot(place_id)
    render text: result.to_json
  end

  private
  def find_id(name)
    session[:search_memo][name] || query_for_id(name)
  end

  def query_for_id(name)
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.spots_by_query(name).first.place_id
  end
end

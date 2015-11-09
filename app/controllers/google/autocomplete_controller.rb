class Google::AutocompleteController < ApplicationController
  def index
    @client = GooglePlaces::Client.new(API_KEY)
    @client.predictions_by_input(
      'San F',
      lat: 0.0,
      lng: 0.0,
      radius: 20000000,
      types: 'geocode',
      language: I18n.locale,
    )
    

    client = Hurley::Client.new(
    "https://maps.googleapis.com/maps/api/place/autocomplete/json?parameters")

    client.query["key"] = ENV['GOOGLE_KEY']
    client.query["input"] = params[:search] 

    https://maps.googleapis.com/maps/api/place/autocomplete/output?parameters
    byebug

    redirect_to place_path 
  end
end

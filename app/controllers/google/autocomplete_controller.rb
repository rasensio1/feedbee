class Google::AutocompleteController < ApplicationController
  def index
    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.predictions_by_input(params[:search])

    predictions = result.reduce(Hash.new) do |agg, place|
      agg[name(place)] = place.place_id
      agg
    end
    session[:search_memo] = predictions

    respond_to do |format|
      format.json { render json: predictions }
    end
  end
  
  private

  def name(place)
    place.terms.first["value"]
  end
end

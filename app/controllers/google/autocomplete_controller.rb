class Google::AutocompleteController < ApplicationController
  def index
    #OPEN SSL NEEDS TO BE FIXED PROPERLY

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.predictions_by_input(params[:search])

    predictions = result.reduce(Hash.new) do |agg, place|
      agg[name(place)] = place.place_id
      agg
    end

    #Save ids in sessions, to prevent excess call for id id not necessary.
    #This is because the autocomplete returns ids. We can store then and prevent excess calls.
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

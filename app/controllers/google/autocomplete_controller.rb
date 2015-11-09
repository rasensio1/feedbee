class Google::AutocompleteController < ApplicationController
  def index
    #OPEN SSL NEEDS TO BE FIXED PROPERLY

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.predictions_by_input(params[:search])

    predictions = result.map do |place|
      { name: place.terms.first["value"]}
        place_id: place.place_id }
    end

    #Save ids in sessions, to prevent excess call for id id not necessary.
    #This is because the autocomplete returns ids. We can store then and prevent excess calls.
    sessions[:search_memo] = predictions

    respond_to do |format|
      format.json { render json: predictions }
    end
  end

  def show
    place_id = find_id(params[:go_to])

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.spot(place_id)
    render result.to_json
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

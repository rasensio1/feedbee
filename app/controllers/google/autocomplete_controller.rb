class Google::AutocompleteController < ApplicationController
  def index

    #OPEN SSL NEEDS TO BE FIXED PROPERLY

    @client = GooglePlaces::Client.new(ENV['GOOGLE_KEY'])
    result = @client.predictions_by_input(params[:search])

    predictions = result.map do |place|
      { name: place.terms.first["value"],
        place_id: place.place_id }
    end

    respond_to do |format|
      format.json { render json: predictions }
    end
  end
end

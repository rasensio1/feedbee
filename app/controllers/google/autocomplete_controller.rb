class Google::AutocompleteController < ApplicationController
  def index
    https://maps.googleapis.com/maps/api/place/autocomplete/output?parameters
    byebug

    redirect_to place_path 
  end
end

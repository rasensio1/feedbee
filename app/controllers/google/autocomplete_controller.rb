class Google::AutocompleteController < ApplicationController
  def index
    predictions = Autocompleter.api_results(params[:search])
    session[:search_memo] = predictions
    render json: predictions
  end
end

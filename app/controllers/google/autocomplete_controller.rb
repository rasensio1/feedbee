class Google::AutocompleteController < ApplicationController
  def index
    predictions = Autocompleter.api_results(params[:search])
    session[:search_memo] = predictions
    capitalized = Hash[predictions.map {|k,v| [k.titleize, v]}]
    clear_search_memo

    render json: capitalized
  end
end

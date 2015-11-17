class Google::SearchController < ApplicationController
  def index
    @search_text = params[:search_text]
    @places = Place.for_ids(params[:searches])
    clear_search_memo
  end
end

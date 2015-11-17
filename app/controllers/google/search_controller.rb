class Google::SearchController < ApplicationController
  def index
    @search_text = params[:search_text]
    @places = params[:searches].map do |id|
      Place.for_id(id)
    end
    clear_search_memo
  end
end

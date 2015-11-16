class Google::SearchController < ApplicationController
  def index
    @places = params[:searches].map do |id|
      Place.for_id(id)
    end
  end
end

class Google::SearchController < ApplicationController
  def index
    byebug
    params[:searches].map do |id|
      Place.for_id(id)
    end
  end
end

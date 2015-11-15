class PlacesController < ApplicationController
  def create
    place_id = find_id(params[:go_to])
    if (place_id) && (place_id != "ChIJDTLonUMZe0cRIaabPcSwTtw")
      redirect_to place_path(slug: Place.slug_for_show(place_id))
    else
      flash['message'] = "Sorry, no results for #{params[:go_to]}. Try something else!"
      redirect_to root_path 
    end
  end

  def show
    @place = current_place
    @address = @place.address || Address.new()
    @comment = Comment.new
  end

  private
  
  def find_id(search_text)
    if session[:search_memo]
      session[:search_memo][search_text] || Place.query_for_id(search_text)
    else
      Place.query_for_id(search_text)
    end
  end

  def current_place
    Place.find_by(slug: params[:slug])
  end
end

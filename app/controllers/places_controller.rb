class PlacesController < ApplicationController

  def create
    if place_id = IdFinder.go(session, params[:go_to])
      redirect_to place_path(slug: Place.slug_for_show(place_id))
    else
      flash['message'] = "Sorry, no results for #{params[:go_to]}. Try something else!"
      redirect_to root_path 
    end
  end

  def show
    @presenter = PlacePresenter.new(current_place)
    @comment = Comment.new()
  end

  private
  
  def current_place
    Place.find_by(slug: params[:slug])
  end
end

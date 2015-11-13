require 'net/https'

class PlacesController < ApplicationController

  def create
    if place_id = find_id(params[:go_to]) && find_id(params[:go_to]) != "ChIJDTLonUMZe0cRIaabPcSwTtw"
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
  
  def find_id(name)
    if session[:search_memo]
      session[:search_memo][name] || Place.query_for_id(name)
    else
      Place.query_for_id(name)
    end
  end

  def current_place
    Place.find_by(slug: params[:slug])
  end
end

class PlacesController < ApplicationController

  def create
    if col_place_ids = IdFinder.go(session, params[:go_to])
      if one_result?(col_place_ids)
        redirect_to place_path(slug: Place.slug_for_show(col_place_ids.first))
      else
        redirect_to search_path(searches: col_place_ids, search_text: params[:go_to])
      end
    else
      flash['message'] = "Sorry, no results for #{params[:go_to]}. Try something else!"
      redirect_to root_path 
    end
  end

  def show
    @presenter = PlacePresenter.new(current_place)
    @comment = Comment.new()
    clear_search_memo
  end

  private
  
  def current_place
    Place.find_by(slug: params[:slug])
  end

  def one_result?(place_ids)
    place_ids.size == 1
  end
end

class PlacesController < ApplicationController

  def create
    place_ids = IdFinder.go(session, params[:go_to])
    no_results?(place_ids, params[:go_to]) and return
    multiple_results?(place_ids, params[:go_to]) and return

    slug = Place.slug_for_show(place_ids.first)
    no_results?(slug, params[:go_to]) and return
    redirect_to place_path(slug: slug)
  end

  def show
    @presenter = PlacePresenter.new(current_place)
    @comment = Comment.new()
    clear_search_memo
  end

  private

  def multiple_results?(ids, search_text)
    if !one_result?(ids)
      redirect_to search_path(searches: ids, search_text: search_text) and return true
    end
  end

  def no_results?(ids, search_text)
    if !ids
      flash['message'] = "Sorry, no results for #{search_text}. Try something else!"
      redirect_to root_path and return true
    end
  end
  
  def current_place
    Place.find_by(slug: params[:slug])
  end

  def one_result?(place_ids)
    place_ids.size == 1
  end
end

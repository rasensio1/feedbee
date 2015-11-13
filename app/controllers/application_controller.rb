class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :votes

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def votes(comment)
    Vote.where(comment_id: comment.id).sum(:value)
  end

  def require_current_user
    if !current_user
      flash[:errors] = "You must be logged in to perform this action"
      redirect_to :back
    end
  end
end

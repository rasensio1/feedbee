class SessionsController < ApplicationController
  def create
    begin
      if user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
        flash['message'] = "Welcome, #{user.name}!"
      end
    rescue
      flash['message'] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      clear_session
      flash['message'] = "You have been successfully logged out"
    end
    redirect_to root_path
  end

  private
  def clear_session
    session[:user_id] = nil
  end
end

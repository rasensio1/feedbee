class SessionsController < ApplicationController
  def create
    begin
      if user = User.from_omniauth(request.env['omniauth.auth'])
        session[:user_id] = user.id
        flash[:success] = "Welcome, #{user.name}!"
      end
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end
end

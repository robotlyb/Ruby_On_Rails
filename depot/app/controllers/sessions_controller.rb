class SessionsController < ApplicationController
  skip_before_filter :authenticate
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      redirect_to (login_path, :notice => "Wrong login information")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(store_url, :notice => "Logged Out")
  end
end

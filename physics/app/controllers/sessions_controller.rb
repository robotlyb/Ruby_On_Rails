class SessionsController < ApplicationController
  def new
  end

  def create
    if(user = User.authenticate(params[:cas_id], params[:password]))
      session[:user_id] = user.id
      redirect_to home_path
    else
      redirect_to(login_path, :notice => "Wrong Login infomation!")
    end
    
  end

  def destroy
  end
end

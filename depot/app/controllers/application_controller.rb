class ApplicationController < ActionController::Base
  before_filter :authenticate 
  #skip_before_filter :authenticate, :current_cart
  protect_from_forgery
  
  private

    def current_cart 
      Cart.find(session[:cart_id])
    #rescue用于捕获异常
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  protected
    
    def authenticate
      unless User.find_by_id(session[:user_id])
	redirect_to(login_url, :notice => "Please log in first")
      end
    end

end

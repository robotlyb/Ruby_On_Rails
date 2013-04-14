class CheckController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    end
    
    @books = StuBook.where(:user_id => session[:user_id]) 
    @count = (@books.nil? ? 0 : @books.count)  
    
  end
end

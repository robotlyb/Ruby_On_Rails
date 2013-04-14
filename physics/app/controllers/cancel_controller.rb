class CancelController < ApplicationController
  def create
    if session[:user_id] 
      @user = User.find_by_id(session[:user_id])
    end
    
    @books = StuBook.where(:user_id => session[:user_id])
    @count = @books.count

    
  end

  def index
     if session[:user_id] 
      @user = User.find_by_id(session[:user_id])
    end

    @cancel = params[:cancellations] 
    
    @cancel.each do |cancel|
      rest = get_rest(cancel)
      cancel_array = cancel.split('|')
      record = get_record(cancel_array)
      record[0].update_attribute(:rest, (rest + 1))

      destroy_record(cancel_array)
    end
  end
  
  private
  def get_rest(cancel)
    cancel_array = cancel.split('|') 
    record = get_record(cancel_array)
    rest = record[0].rest
  end
  
  def get_record cancel_array
    record = ExtBooked.where(:experiment_id => cancel_array[0].to_i, :day => cancel_array[1])
  end
  
  def destroy_record cancel_array
    record = StuBook.where(:experiment_id => cancel_array[0].to_i, :day => cancel_array[1])
    record[0].destroy
  end
  
end

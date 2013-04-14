class ShowController < ApplicationController
  def create
    if (session[:user_id])
      @user = User.find_by_id(session[:user_id])
    end
  
    @week = params[:week] 
    @experiment = Experiment.find_by_order_id(params[:order_id])
    @rest_array = Hash['Sunday'=>0, 'Monday'=>0, 'Tuesday'=>0, 'Wednesday'=>0, 'Thursday'=>0, 'Friday'=>0, 'Saturday'=>0];
  
    @week_array = %w[日 一 二 三 四 五 六]
    @day = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    for i in 1..7 do
    record = ExtBooked.where("experiment_id = ? AND day = ?", params[:order_id],  ("星期"+ @week_array.at(i-1)))
     if record[0]  
	if record[0].rest > 0
	  @rest_array[@day.at(i-1)] = record[0].rest
	end
     end
    end

    @available_choice = []
    get_avaliable_choices
    

  end

  def show

     if (session[:user_id])
      @user = User.find_by_id(session[:user_id])
    end

    
    @week_array = %w[日 一 二 三 四 五 六]
    @day = params[:day].to_i 
    @experiment = params[:order_id]
    
    
    #update the table ExtBooked 
    record = ExtBooked.where("experiment_id = ? AND day = ?", params[:order_id], ("星期" + @week_array.at(@day-1)))
    rest = record[0].rest - 1
    
    record[0].update_attribute(:rest, rest)
  
    #insert a record to StuBook
    StuBook.create(:user_id => session[:user_id], :experiment_id => params[:order_id], :day => ("星期" + @week_array.at(@day-1)), :date => Time.now)
  end

  private
  
  def get_avaliable_choices
    len = @rest_array.length 
    for i in 1..len do
      if @rest_array[@day.at(i-1)] > 0
	@available_choice.push([@week_array.at(i-1), i])
      end
    end
  end
  
end

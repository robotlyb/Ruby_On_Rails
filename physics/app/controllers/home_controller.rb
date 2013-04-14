class HomeController < ApplicationController

  def index
    
    @array = [['A', 1], ['B', 2], ['C', 3]]
    
    @available_days = []
    for i in 1..6 do
      sum = ExtBooked.where(:experiment_id => i).sum(:rest)
      if sum > 0
	expriment = Experiment.find_by_order_id(i)
	@available_days.push([expriment.ext_name, expriment.order_id])
      end
    end
  
    if(session[:user_id])
      @user = User.find_by_id(session[:user_id]) 
    end
  end
end

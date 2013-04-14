class Experiment < ActiveRecord::Base
  attr_accessible :ext_name, :order_id
  
   
  belongs_to :ext_bookeds
  belongs_to :stu_books
end

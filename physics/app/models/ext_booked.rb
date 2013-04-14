class ExtBooked < ActiveRecord::Base
  attr_accessible :day, :experiment_id, :rest
  
  has_many :experiments
  
  attr_accessible :experiment
end

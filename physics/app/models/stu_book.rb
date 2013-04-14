class StuBook < ActiveRecord::Base
  attr_accessible :date, :day, :experiment_id, :user_id
  
  has_many :users
  has_many :experiments
end

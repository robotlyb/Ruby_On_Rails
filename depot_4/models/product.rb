class Product < ActiveRecord::Base
  attr_accessible :content, :description, :title, :price, :comment

  #validates :content, :description, :title, :price => true
  validates :content, :description, :title, :price, :presence => true

  validates :title, :uniqueness => true

  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  
  has_many :comments
  
  
  
    
end

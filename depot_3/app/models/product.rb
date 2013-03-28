class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  #validate the info not to be null
  validates :description, :image_url, :title, :presence => true
  
  #validate the price is larger than 0.01
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01} 
  
  #valiate  the title to be unique
  validates :title, :uniqueness => true

  #validate the image_url to be proper
  validates :image_url, :format => {
    :with     => %r{\.(gif|jpg|png)$}i,
    :message  => 'must be a URL for GIF, JPG or PNG image.'
  }
  
  default_scope :order => 'title'
end

class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter, :product
  
  belongs_to :product
  
end

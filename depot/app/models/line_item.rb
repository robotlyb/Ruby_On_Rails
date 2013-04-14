class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  belongs_to :product
  belongs_to :cart
  belongs_to :order
    
  #修复Can't mass-assign protected attributes: product的错误
  #可能原因是:默认不可以直接用build来new这个新对象，除非加上attr_accessible :product
  attr_accessible :product
  attr_accessible :quantity
  attr_accessible :cart
  #attr_accessible :order
    
  def total_price
    product.price * quantity 
  end
end

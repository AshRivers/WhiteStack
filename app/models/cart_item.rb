class CartItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id,:order_id
  
  belongs_to :cart
  belongs_to :product
  belongs_to :order
end

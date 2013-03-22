class Order < ActiveRecord::Base
  attr_accessible :additional_info, :address, :cell_phone, :name, :user_id

  has_many :cart_items, dependent: :destroy

  validates :name, :address, :cell_phone, presence: true

  def add_items_from_cart(cart)
  	cart.cart_items.each do |item|
  		item.cart_id = nil
  		cart_items << item
  	end
  end
end

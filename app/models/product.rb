class Product < ActiveRecord::Base
  attr_accessible :description, :estimated_time, :name, :price

  has_many :cart_items
  has_many :comments, as: :commentable
  has_one :picture_assotiation

  before_destroy :any_cart_items_with_this_product?

  REMAIN_TIME = ["In 3 days", "In 2 weeks", "In 1 mounth"]

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :estimated_time, inclusion: REMAIN_TIME

  private 

  	def any_cart_items_with_this_product?
  		if self.cart_items.empty?
  			return true
  		else
  			errors.add(:base, "There are still some carts with this product")
  			return false
  		end
  	end
end

class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :cart_items, dependent: :destroy

  def add_product(product_id)
    curr_item = cart_items.find_by_product_id(product_id)
    if curr_item
      curr_item.quantity +=1
    else
      curr_item = cart_items.build(product_id: product_id)
    end
    curr_item
  end
end

class PictureAssotiation < ActiveRecord::Base
  attr_accessible :picture_id, :product_id

  belongs_to :picture
  belongs_to :product
end

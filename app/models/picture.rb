class Picture < ActiveRecord::Base
  attr_accessible :image, :name

  has_many :picture_assotiations

  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end

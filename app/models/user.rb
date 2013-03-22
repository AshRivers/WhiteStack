class User < ActiveRecord::Base
	has_secure_password

  	attr_accessible :additional_info, :adress, :email, :name, :picture, :cell_phone,
  									:password, :password_confirmation

  	validates :email, uniqueness: true

  	has_many :comments, dependent: :destroy

  	mount_uploader :picture, ImageUploader

end

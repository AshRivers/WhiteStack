class Article < ActiveRecord::Base
  attr_accessible :name, :post

    has_many :comments, as: :commentable
end

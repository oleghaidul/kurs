class Manufacturer < ActiveRecord::Base
	has_many :products
	has_many :comments, :as => :commentable
end

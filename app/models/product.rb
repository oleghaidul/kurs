class Product < ActiveRecord::Base
	belongs_to :category
	has_many :line_items
	default_scope includes(:category)
end

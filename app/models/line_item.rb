class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	def full_price
	  product.price*quantity
	end

end

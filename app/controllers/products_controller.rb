class ProductsController < InheritedResources::Base
	before_filter :authenticate_user!
	before_filter :load_cart
	layout "store/store"
	belongs_to :category

	def load_cart
		@categories = Category.all
		@manufacturers = Manufacturer.all
		@cart = current_user.carts.last
	end

end

class ManufacturersController < InheritedResources::Base
	layout "store/store"
	before_filter :authenticate_user!
	before_filter :load_cart

	def load_cart
		@categories = Category.all
		@manufacturers = Manufacturer.all
		@cart = current_user.carts.last
	end

end

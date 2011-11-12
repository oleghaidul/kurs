class CartsController < InheritedResources::Base
	layout "store/store"
	belongs_to :user
	before_filter :load_cart

	def load_cart
		@cart = current_user.carts.last
		@manufacturers = Manufacturer.all
		@categories = Category.all
	end
end

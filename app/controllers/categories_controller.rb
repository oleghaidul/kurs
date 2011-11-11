class CategoriesController < InheritedResources::Base
	layout "store/store"
	before_filter :authenticate_user!
	before_filter :load_cart

	def index
		super do
			@products = Product.includes(:category)
		end
	end

	def load_cart
		@categories = Category.all
		@cart = current_user.carts.last
	end

end

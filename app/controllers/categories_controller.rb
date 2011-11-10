class CategoriesController < InheritedResources::Base
	layout "store/store"
	before_filter :authenticate_user!
	before_filter :load_cart

	def index
		super do
			@products = Product.includes(:category)
		end
	end

	def show
		super do
			@products = @category.products
		end	
	end

	def load_cart
		@cart = current_user.carts.last
	end

end

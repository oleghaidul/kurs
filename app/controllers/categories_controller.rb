class CategoriesController < InheritedResources::Base
	layout "store/store"
	respond_to :js, :html
	before_filter :authenticate_user!
	before_filter :load_cart

	def index
		super do
			@products = Product.includes(:category).search(params[:search], params[:category])
		end
	end

	def load_cart
		@categories = Category.all
		@manufacturers = Manufacturer.all
		@cart = current_user.carts.last

	end

end

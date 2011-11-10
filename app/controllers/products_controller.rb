class ProductsController < InheritedResources::Base
	before_filter :load_category
	layout "store/store"
	belongs_to :category

	def load_category
		@categories = Category.all
		@cart = current_user.carts.last
	end
end

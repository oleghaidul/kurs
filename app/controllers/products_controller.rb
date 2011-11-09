class ProductsController < InheritedResources::Base
	before_filter :load_category
	layout "store/store"
	belongs_to :category

	def load_category
		@categories = Category.all
	end
end

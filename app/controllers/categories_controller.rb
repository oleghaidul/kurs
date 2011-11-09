class CategoriesController < InheritedResources::Base
	layout "store/store"

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

end

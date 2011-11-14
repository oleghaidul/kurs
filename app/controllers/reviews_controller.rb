class ReviewsController < InheritedResources::Base
	layout 'auto/cars'
	belongs_to :car, :polymorphic => true

	def index
		super do
			@review = Review.new
		end
	end

end

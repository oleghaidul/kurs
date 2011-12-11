class ReviewsController < InheritedResources::Base
	before_filter :load_similar
	layout 'auto/cars'
	belongs_to :car, :polymorphic => true

	def index
		super do
			@review = Review.new
		end
	end

	def load_similar
		@similar_cars = Car.where(:engine => 10).limit(10)
	end

end

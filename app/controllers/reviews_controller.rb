class ReviewsController < InheritedResources::Base
	layout 'auto/cars'
	belongs_to :car

end

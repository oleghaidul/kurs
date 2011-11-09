class CartsController < InheritedResources::Base
	layout "store/store"
	belongs_to :user
end

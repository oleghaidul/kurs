class PicturesController < InheritedResources::Base
	belongs_to :news, :car, :product, :polymorphic => true
	layout 'auto/cars'
end
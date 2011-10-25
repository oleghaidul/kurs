class PicturesController < InheritedResources::Base
	belongs_to :news, :car, :polymorphic => true
	layout 'auto/cars'
end
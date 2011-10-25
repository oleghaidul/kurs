class Auto::OptionsController < InheritedResources::Base
	belongs_to :car, :polymorphic => true
	layout 'auto/cars'
end
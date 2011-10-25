class Picture < ActiveRecord::Base
	belongs_to :imageable, :polymorphic => true

	has_attached_file :image

	scope :cars, where(:imageable_type => "Car")

end

class Picture < ActiveRecord::Base
	belongs_to :imageable, :polymorphic => true
	accepts_nested_attributes_for :imageable
	has_attached_file :image

	scope :cars, where(:imageable_type => "Car")

end

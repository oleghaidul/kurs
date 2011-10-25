class Option < ActiveRecord::Base
	belongs_to :car

	def self.car_params(car_params)
		where("option_type LIKE ?", car_params) 
	end

end

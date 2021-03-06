ActiveAdmin.register Car do
  menu :parent => I18n.t("auto")
 
  controller do
  	def new
			super do
		    @car.pictures.build
	  	end
    end
  end

  form :html => { :enctype => "mmultipart/form-data" } do |f|  
  f.inputs do
  	f.input :model_id, :as => :select, :collection => Model.all
  	f.input :name
  	f.input :description
  	f.input :year, :as => :select, :collection => 2000..2012
    f.input :car_type, :as => :radio, :collection => ["New","Used"]
    f.input :price
    f.input :horsepower
	f.input :seating_capacity
	f.input :engine
	f.input :fuel_type, :as => :radio, :collection => 
			["diesel","electric","ethanol","gasoline","hybrid","natural_gas"]
	f.input :towing_capacity
	f.input :body_style, :as => :radio, :collection =>
			["hatchback","coupe","sedan","truck","suv",
                              "crossover","convertible","van","wagon"]
	f.input :transmission, :as => :radio, :collection => 
			["automatic", "manual"]
	f.input :drive_type, :as => :radio, :collection => ["two_wd", "four_wd", "all_wd"]
 	f.input :discount
  end

  f.inputs do 
    f.has_many :pictures do |p| 
      p.inputs :image, :as => file 
    end 
   end 

  f.buttons
end
end

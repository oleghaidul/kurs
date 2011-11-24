ActiveAdmin.register Product do
  menu :parent => I18n.t("store")
 
  controller do
  	def new
			super do
		    @product.pictures.build
	  	end
    end
  end

  form :html => { :enctype => "mmultipart/form-data" } do |f|  
  f.inputs do
  	f.input :category_id, :as => :select, :collection => Model.all
    f.input :manufacturer_id, :as => :select, :collection => Manufacturer.all
  	f.input :name
  	f.input :description
  	f.input :assignment
    f.input :design
    f.input :construction
    f.input :price
  end

  f.inputs do 
    f.has_many :pictures do |pp| 
      pp.inputs :image, :as => file
    end 
   end 

  f.buttons
end
end

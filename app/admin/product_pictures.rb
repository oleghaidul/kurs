ActiveAdmin.register Picture, :as => "Product_pictures" do

	menu :parent => "Pictures"

  form :html => { :enctype => "multipart/form-data" } do |f|  
  f.inputs do
  	f.input :name
  	f.input :imageable_id, :as => :select, :collection => News.all
  	f.input :imageable_type, :as => :select, :collection => ["News"], :include_blank => false
    f.input :image, :as => :file
  end

  f.buttons
end

end

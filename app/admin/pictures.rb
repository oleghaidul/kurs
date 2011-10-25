ActiveAdmin.register Picture do
  form :html => { :enctype => "multipart/form-data" } do |f|  
  f.inputs do
  	f.input :name
  	f.input :imageable_id
  	f.input :imageable_type, :as => :radio, :collection => ["News", "Car", "Movie"]
    f.input :image, :as => :file
  end

  f.buttons
end

end

ActiveAdmin.register News do
	controller do
  	def new
			super do
		    @news.pictures.build
	  	end
    end
  end

  form :html => { :enctype => "mmultipart/form-data" } do |f|  
  f.inputs do
  	f.input :name
  	f.input :body
  	f.input :news_type, :as => :select, :collection => ["local", "world", "business", "sports", 
                        "entertainment", "science", "health", "cars", 
                        "movies", "games", "main"]
    f.input :archived, :as => :boolean
  end

  f.inputs "Pictures" do 
    f.has_many :pictures do |pp| 
      pp.inputs :image, :as => file 
    end 
   end 

  f.buttons
end
end
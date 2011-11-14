ActiveAdmin.register Movie do

	controller do
  	def new
			super do
		    @movie.pictures.build
	  	end
    end
  end

  form do |f|
  	f.inputs do
	  	f.input :name
	  	f.input :description
	  	f.input :genre
	  	f.input :year
	  	f.input :time
	  	f.input :release_date
	  	f.input :distributors
	  	f.input :status
  	end
  	
  	f.inputs "Pictures" do 
    f.has_many :pictures do |pp| 
      pp.inputs :image, :as => file 
    end 
  end 

	  f.buttons
	end

end

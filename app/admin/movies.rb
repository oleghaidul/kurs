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
	  	f.input :genre, :as => :select, :collection => ["Action","Thriller"]
	  	f.input :year, :as => :select, :collection => 1960..2040
	  	f.input :time
	  	f.input :release_date, :as => :select, :collection => 2012..2040
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

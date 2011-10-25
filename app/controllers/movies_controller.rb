class MoviesController < InheritedResources::Base
	layout 'movies/movies'
	
	def index
		@movies_coming = Movie.coming.limit(5)
		@movies_last = Movie.recent.limit(12)
		@movies_top_rated = Movie.top_rated.limit(12)
		@news = News.movies.limit(5)
	end

	def latest
		@movies = Movie.recent
		@type = "LATEST"
		render "movies"
	end

	def coming
		@movies = Movie.coming
		@type = "COMING SOON"
		render "movies"
	end

	def top_rated
		@movies = Movie.top_rated
		@type = "TOP RATED"
		render "movies"
	end

	def votes
		@movies = Movie.find(params[:id])
		@movies.liked_by current_user
		redirect_to :back, :notice => "Thanx"
	end
	
end

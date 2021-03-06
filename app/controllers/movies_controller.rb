class MoviesController < InheritedResources::Base
	layout 'movies/movies'
	before_filter :load_search
	
	def index

		@movies = Movie.scoped
		@news = News.movies.limit(5)
	end

	def latest
		@movies = Movie.recent
		@type = I18n.t("latest")
		render "movies"
	end

	def coming
		@movies = Movie.coming
		@type = I18n.t("coming_soon")
		render "movies"
	end

	def top_rated
		@movies = Movie.top_rated
		@type = I18n.t("top_rated")
		render "movies"
	end

	def votes
		@movies = Movie.find(params[:id])
		@movies.liked_by current_user
		redirect_to :back, :notice => "Thanx"
	end

	def top_commented
		@movies = Movie.top_commented
		@type = I18n.t("most_commented")
		render "movies"
	end

	def search
		@search = Movie.search(params[:search])
		@movies = @search.all
	end

	private

		def load_search
			@search = Movie.search(params[:search])
		end
	
end

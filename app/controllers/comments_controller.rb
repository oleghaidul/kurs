class CommentsController < InheritedResources::Base
	belongs_to :news, :movie, :polymorphic => true
	layout :find_layout

	def index
		super do
			@comment = Comment.new
		end
	end

	def create
		create! {collection_url}
	end

	protected
		def find_layout
			case parent_class.name
				when "News"
					"news"
				when "Movie"
					"movies/movies"
				else
					"application"
				end
		end
		

end

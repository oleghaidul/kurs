class NewsController < InheritedResources::Base
has_scope :news_type
layout 'news'

  def show
    @news = News.find(params[:id])
    @comment = @news.comments
  end
  
  protected
    def collection
      @news ||= end_of_association_chain.page(params[:page])
    end
end
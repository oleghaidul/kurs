class PagesController < ApplicationController
  
  def home
    @title = t('nav.home')
  end
  
  def news
  	@news = News.limit(5)
  end

  def services

  end
  
end

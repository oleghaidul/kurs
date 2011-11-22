class PagesController < ApplicationController
  
  def home
    @title = t('nav.home')
  end
  
  def news
  	@news = News.main
  end

  def services

  end
  
end

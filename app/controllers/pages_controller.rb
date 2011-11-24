class PagesController < ApplicationController
  
  def home
    @title = t('nav.home')
  end
  
  def news
  	@news = News.main
  end

  def services

  end

  def products
  	@products = Product.limit(20)
  end
  
end

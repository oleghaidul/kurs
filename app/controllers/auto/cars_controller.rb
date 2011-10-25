class Auto::CarsController < InheritedResources::Base
  layout 'auto/cars'
  has_scope :body_style
  has_scope :discount

  before_filter :categories

  def index
  	@search = Car.search(params[:search])
  	@cars = @search
    @pictures = Picture.cars
  end

  def show
    @car = Car.find(params[:id])
    @options = @car.options
    @car.liked_by User.first
  end

  def news
    @news = News.cars
  end

  def new_cars
    @search = apply_scopes(Car.new_cars).search(params[:search])
    @cars = @search.page(params[:page]).per(15)
    render "params"
  end
  
  def used_cars
    @search = apply_scopes(Car.used_cars).search(params[:search])
    @cars = @search.page(params[:page]).per(15)
    render "params"
  end

  def categories
    @makes = Make.all
    @models = Model.all
  end

  def news
    @news = News.cars
  end

end

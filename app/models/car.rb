class Car < ActiveRecord::Base
  acts_as_votable
  has_many :pictures, :as => :imageable
  accepts_nested_attributes_for :pictures

  has_many :comments, :as => :commentable
	attr_accessible :name, :model_id, :description, :car_type, 
                  :year, :price, :transmission, :drive_type,
                  :horsepower, :engine, :fuel_type, :seating_capacity, :pictures_attributes
  
  belongs_to :model
  has_many :reviews, :as => :reviewable
  has_many :options, :dependent => :destroy
  has_many :comforts
  has_many :entertainments
  has_many :safeties
  
  scope :body_style, proc { |body_style| where(:body_style => body_style) }
  scope :discount, proc { |discount| where(:discount => discount) }
  scope :new_cars, where(:car_type => "new")
  scope :used_cars, where(:car_type => "used")
  scope :featured, where("discount > 10").order("discount DESC").limit(5)


end

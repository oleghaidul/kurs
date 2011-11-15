class News < ActiveRecord::Base
	has_many :pictures, :as => :imageable
  accepts_nested_attributes_for :pictures

  attr_accessible :pictures_attributes

  has_many :comments, :as => :commentable

  scope :news_type, proc { |news_type| where(:news_type => news_type) }
  
  scope :cars, where(:news_type => "cars")
  scope :games, where(:news_type => "games")
  scope :movies, where(:news_type => "movies")
  scope :sports, where(:news_type => "sports")
  scope :jobs, where(:news_type => "jobs")
  scope :main, where(:news_type => "main")

  scope :world, where(:news_type => "world")



  
  default_scope order("created_at DESC")

end

# == Schema Information
#
# Table name: news
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  body       :text
#  photo      :string(255)
#  news_type  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#


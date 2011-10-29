class Movie < ActiveRecord::Base
	acts_as_votable
	
	has_many :comments, :as => :commentable
	has_many :reviews, :as => :reviewable
	has_many :pictures, :as => :imageable

  scope :genre, proc { |genre| where(:genre => genre) }

	scope :top_rated, order("rate DESC")
	scope :recent, order("created_at DESC")
	scope :top_commented, order("comments_count DESC")
	scope :coming, where("release_date > ?", Time.now)

	
end
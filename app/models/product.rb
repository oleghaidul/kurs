class Product < ActiveRecord::Base

	has_many :pictures, :as => :imageable
  accepts_nested_attributes_for :pictures

  attr_accessible :pictures_attributes

	belongs_to :category
	belongs_to :manufacturer
	has_many :line_items
	has_many :reviews, :as => :reviewable

	scope :latest, order("created_at DESC").limit(9)

	def self.search(search, category)
		if category	
			if search
				category.products.where('name LIKE ?', "%#{search}%")
			else
				scoped
			end
		else
			if search
				where('name LIKE ?', "%#{search}%")
			else
				scoped
			end
		end
	end

end

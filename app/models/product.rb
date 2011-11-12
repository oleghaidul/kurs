class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :manufacturer
	has_many :line_items

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

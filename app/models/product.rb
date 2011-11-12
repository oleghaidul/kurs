class Product < ActiveRecord::Base
	belongs_to :category
	belongs_to :manufacturer
	has_many :line_items

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

end

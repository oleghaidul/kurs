class Cart < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
  belongs_to :user

  def add_product(product_id, cart_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id, :cart_id => cart_id)
    end
    current_item
  end

  def delete_product(product_id, cart_id)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity -= 1
    else
      current_item = line_items.where(:product_id => product_id).destroy
    end
  end

  def total_price
    line_items.to_a.sum(&:full_price)
  end

end

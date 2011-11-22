class LineItemsController < ApplicationController
	
	def create
		@cart = current_cart
    product = Product.find(params[:product_id])
    if @cart.nil?
      @cart = Cart.create(:name => "MyCart", :user_id => current_user.id)
      if @cart.add_product(product.id, @cart.id).save
      end
    else
      if @cart.add_product(product.id, @cart.id).save
      end
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    @cart = current_cart
    @carts = current_user.carts
  end

  private 
  	
  	def current_cart
		  current_user.carts.last
		end

end

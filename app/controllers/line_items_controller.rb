class LineItemsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@cart = current_cart
    product = Product.find(params[:product_id])
    if @cart.nil?
      @cart = Cart.create(:name => "MyCart", :user_id => current_user.id)
      if @cart.add_product(product.id).save
      	
        #redirect_to [current_user, @cart]
      end
    else
      if @cart.add_product(product.id).save
        #redirect_to [@cart.user, @cart]
      end
    end
  end

  private 
  	
  	def current_cart
		  current_user.carts.last
		end

end

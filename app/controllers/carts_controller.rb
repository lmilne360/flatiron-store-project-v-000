class CartsController < ApplicationController

	def show
	end

	def checkout
		current_cart.checkout
		current_user.carts.delete_all
		redirect_to cart_path(Cart.last.id)
	end

end

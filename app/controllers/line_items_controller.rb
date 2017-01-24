class LineItemsController < ApplicationController

	def create
		
		if !current_cart.nil?
			current_cart.add_item(params[:item_id])
		else
			c = current_user.carts.create
			c.add_item(params[:item_id])
			
		end

		redirect_to current_cart
	end



end

class LineItemsController < ApplicationController

def create
  #binding.pry
  if !current_user.current_cart
    current_user.current_cart = Cart.create(:user_id => current_user.id)
  end
  current_user.current_cart.add_item(params[:item_id]).save

  redirect_to cart_path(current_user.current_cart)
end

end

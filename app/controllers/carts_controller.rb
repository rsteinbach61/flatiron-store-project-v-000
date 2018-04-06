class CartsController < ApplicationController

  def new
    @cart = Cart.new
  end

  def create

  end

  def current_cart

  end

  def show
    #binding.pry
    @current_cart = Cart.find(params[:id])
  end

  def checkout

    current_user.current_cart.line_items.each do |li|
      li.item.inventory -= li.quantity
      li.item.save
    end
    current_user.current_cart.status = "submitted"
    current_user.current_cart = nil
    redirect_to cart_path(params[:id])
  end
end

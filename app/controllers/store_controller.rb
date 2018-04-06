class StoreController < ApplicationController

  def index
    #binding.pry
    @items = Item.all
    @categories = Category.all
    @user = current_user
  end

end

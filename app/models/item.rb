class Item < ActiveRecord::Base

  #has_many :category_items
  belongs_to :category
  has_many :carts, :through => :line_items
  has_many :line_items

  def self.available_items
    available_items = Item.all.select {|i| i.inventory > 0}
  end

end

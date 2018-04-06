class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :line_items
  has_many :line_items

  def add_item(item_id)
    item = Item.find(item_id)

    line_item = self.line_items.find {|i| i.item_id == item.id}

    if line_item
      line_item.quantity += 1
    else
      line_item = LineItem.new(:item_id => item.id, :cart_id => self.id, :quantity => 1)
    end
    line_item
  end

  def total
    total = 0
    self.line_items.each do |li|
      total = total + (li.item.price * li.quantity)
    end
    total
  end
end

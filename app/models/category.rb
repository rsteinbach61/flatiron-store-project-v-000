class Category < ActiveRecord::Base
  #has_many :category_items
  has_many :items
  accepts_nested_attributes_for :items
end

class Item < ApplicationRecord
  belongs_to :genres
  has_many :cart_items
  has_many :order_items
end

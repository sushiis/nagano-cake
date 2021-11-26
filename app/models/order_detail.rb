class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  validates :amount, presence: true
  validates :making_statusing, presence: true
  validates :price, presence: true
  
end

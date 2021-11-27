class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :amount, presence: true
  validates :making_status, presence: true
  validates :price, presence: true

end

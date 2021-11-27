class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  
  validates :postage, presence: true
  validates :total_price, presence: true
  validates :way, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :status, presence: true

  enum way: { "クレジットカード": 0, "銀行振込": 1 }
  enum status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
  
  def with_tax_price
    (price * 1.1).floor
  end


end


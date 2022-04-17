class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1}
  
  def add_tax_price
    (self.tital_price * 1.08).round
  end 
end

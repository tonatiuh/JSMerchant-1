class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity
  
  belongs_to :order
  belongs_to :product

  validates_presence_of :order_id, :product_id
end

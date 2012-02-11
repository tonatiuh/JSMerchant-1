class OrderItem < ActiveRecord::Base
  attr_accessible :product_id, :order_id, :quantity
  
  belongs_to :order
  belongs_to :product

  validates_presence_of :order_id, :product_id
  validates :quantity, :quantity_format => true

  def subtotal
    self.product.price * self.quantity
  end
end

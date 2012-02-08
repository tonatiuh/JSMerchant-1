class Order < ActiveRecord::Base
  has_many :order_items, :dependent => :destroy

  def total
    total = 0
    for item in self.order_items
      total = item.subtotal + total
    end
    return total
  end
end

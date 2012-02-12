class Order < ActiveRecord::Base
  attr_accessible :user, :status

  has_many :order_items, :dependent => :destroy
  belongs_to :user, :foreign_key => :customer_id

  def total
    total = 0
    for item in self.order_items
      total = item.subtotal + total
    end
    return total
  end
end

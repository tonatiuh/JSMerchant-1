class Product < ActiveRecord::Base
  attr_accessible :title, :price, :description, :image_url, :stock

  validates_numericality_of :price

  validates :stock, :stock_format => true

  def price=(input)
    input.delete!("$")
    super
  end
end

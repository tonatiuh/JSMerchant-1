module ProductsHelper
  def print_price(price)
    number_to_currency price
  end

  def print_stock(stock)
    if stock > 0
      return "<span class='in_stock'>In Stock (#{(stock)})</span>"
    else
      return "<span class='out_of_stock'>Out of Stock</span>"
    end
  end
end

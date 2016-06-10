require "pry"

class CashRegister

  attr_accessor :total, :discount, :items, :recent_item

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @recent_item = 0
  end

  def add_item(title, price, quantity = 1)
    @title = title
    @price = price
    @quantity = quantity
    @total = @total + (price * quantity)
    @recent_item = (price * quantity)
    while quantity >= 1
      @items << title
      quantity -= 1
    end
  
  end

  def apply_discount
 #   binding.pry
    @total = @total - ((@discount/100.0) * @total)
    if @discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @recent_item
  end

end
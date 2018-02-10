# frozen_string_literal: true

class LineItem
  attr_reader :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
  end

  def details
    {
      name: name,
      price: price,
      quantity: quantity
    }
  end
end

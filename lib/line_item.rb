# frozen_string_literal: true

class LineItem
  IMPORTED = 'imported'

  attr_reader :name, :price, :quantity, :imported

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
    @imported = item_imported?(name)
  end

  def details
    {
      name: name,
      price: price,
      quantity: quantity,
      imported: imported
    }
  end

  private

    def item_imported?(name)
      name.include?(IMPORTED)
    end
end

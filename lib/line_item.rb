# frozen_string_literal: true

class LineItem
  IMPORTED = 'imported'
  ITEMS_EXEMPT_FROM_BASIC_SALES_TAX = { books: ['book'],
                                        food: %w[chocolate chocolates],
                                        medical_products: ['pills'] }.freeze

  attr_reader :name, :price, :quantity, :imported, :basic_sales_tax

  def initialize(name, price, quantity)
    @name = name
    @price = price
    @quantity = quantity
    @imported = item_imported?(name)
    @basic_sales_tax = basic_sales_tax_is_applicable?(name)
  end

  def details
    {
      name: name,
      price: price,
      quantity: quantity,
      imported: imported,
      basic_sales_tax: basic_sales_tax
    }
  end

  private

    def item_imported?(name)
      name.include?(IMPORTED)
    end

    def basic_sales_tax_is_applicable?(name)
      !ITEMS_EXEMPT_FROM_BASIC_SALES_TAX.values.flatten.any? { |word| name.include?(word) }
    end
end

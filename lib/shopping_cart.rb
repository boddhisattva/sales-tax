class ShoppingCart
  attr_reader :items, :tax_calculator, :receipt_generator

  def initialize(items, tax_calculator, receipt_generator)
    @items = items
    @tax_calculator = tax_calculator
    @receipt_generator = receipt_generator
  end

  def purchase_items
    total_sales_tax = 0
    items_price_inclusive_of_taxes = []

    items.each do |item|
      item_details = item.details
      item_price_inclusive_of_tax, total_sales_tax_on_item = tax_calculator.calculate_tax(item_details)
      total_sales_tax += total_sales_tax_on_item * item_details[:quantity]
      total_item_cost = item_price_inclusive_of_tax * item_details[:quantity]
      items_price_inclusive_of_taxes << LineItem.new(item_details[:name], total_item_cost, item_details[:quantity])
    end

    receipt_generator.generate(items_price_inclusive_of_taxes, total_sales_tax)
  end
end

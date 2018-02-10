# frozen_string_literal: true

require 'bigdecimal'

class TaxCalculator
  ITEMS_EXEMPT_FROM_SALES_TAX = { books: ['book'],
                                  food: %w[chocolate chocolates],
                                  medical_products: ['pills'] }.freeze

  BASIC_SALES_TAX_RATE = (1 / BigDecimal.new(10)).freeze
  IMPORT_DUTY_SALES_TAX_RATE = (1 / BigDecimal.new(20)).freeze
  IMPORTED = 'imported'.freeze
  NUMBER_TO_ROUND_OFF_TO = (1 / BigDecimal.new(20)).freeze

  def calculate_tax(item_details)
    total_sales_tax_on_item = calculate_sales_tax(item_details)
    item_price_inclusive_of_tax = item_details[:price] + total_sales_tax_on_item

    [item_price_inclusive_of_tax, total_sales_tax_on_item]
  end

  private

    def calculate_sales_tax(item_details)
      basic_sales_tax = calculate_basic_sales_tax(item_details)
      import_duty_sales_tax = calculate_import_duty_sales_tax(item_details)
      total_sales_tax_on_item(basic_sales_tax, import_duty_sales_tax)
    end

    def calculate_basic_sales_tax(item_details)
      return BigDecimal.new(0) if sales_tax_is_not_applicable?(item_details[:name])

      round_up_to_the_nearest_number(item_details[:price] * BASIC_SALES_TAX_RATE)
    end

    def calculate_import_duty_sales_tax(item_details)
      if item_is_imported?(item_details[:name])
        round_up_to_the_nearest_number(item_details[:price] * IMPORT_DUTY_SALES_TAX_RATE)
      else
        BigDecimal.new(0)
      end
    end

    def sales_tax_is_not_applicable?(item_name)
      ITEMS_EXEMPT_FROM_SALES_TAX.values.flatten.any? { |word| item_name.include?(word) }
    end

    def round_up_to_the_nearest_number(price)
      (price / NUMBER_TO_ROUND_OFF_TO).ceil * NUMBER_TO_ROUND_OFF_TO
    end

    def item_is_imported?(item_name)
      item_name.include?(IMPORTED)
    end

    def total_sales_tax_on_item(basic_sales_tax, import_duty_sales_tax)
      basic_sales_tax + import_duty_sales_tax
    end
end

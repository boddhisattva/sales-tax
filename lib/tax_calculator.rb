# frozen_string_literal: true

require 'bigdecimal'

class TaxCalculator
  BASIC_SALES_TAX_RATE = (1 / BigDecimal(10))
  IMPORT_DUTY_SALES_TAX_RATE = (1 / BigDecimal(20))
  NUMBER_TO_ROUND_OFF_TO = (1 / BigDecimal(20))

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
    return BigDecimal(0) unless item_details[:basic_sales_tax]

    round_up_to_the_nearest_number(item_details[:price] * BASIC_SALES_TAX_RATE)
  end

  def calculate_import_duty_sales_tax(item_details)
    if item_details[:imported]
      round_up_to_the_nearest_number(item_details[:price] * IMPORT_DUTY_SALES_TAX_RATE)
    else
      BigDecimal(0)
    end
  end

  def round_up_to_the_nearest_number(price)
    (price / NUMBER_TO_ROUND_OFF_TO).ceil * NUMBER_TO_ROUND_OFF_TO
  end

  def total_sales_tax_on_item(basic_sales_tax, import_duty_sales_tax)
    basic_sales_tax + import_duty_sales_tax
  end
end

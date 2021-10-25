# frozen_string_literal: true

class ReceiptGenerator
  def generate(items, total_sales_tax)
    total_cost = 0

    items.each do |item|
      item_details = item.details
      puts "#{item_details[:quantity]}, #{item_details[:name]}, #{convert_big_decimal_to_floating_point_notation(item_details[:price])}\n"
      total_cost += item_details[:price]
    end

    puts "\nSales Taxes: #{convert_big_decimal_to_floating_point_notation(total_sales_tax)}"
    puts "Total: #{convert_big_decimal_to_floating_point_notation(total_cost)}"
  end

  private

  def convert_big_decimal_to_floating_point_notation(number)
    number.to_s('F')
  end
end

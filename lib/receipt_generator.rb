class ReceiptGenerator
  def generate(items, total_sales_tax)
    total_cost = 0

    items.each do |item|
      item_details = item.details
      puts "#{item_details[:quantity]}, #{item_details[:name]}, #{item_details[:price].to_s('F')}\n"
      total_cost += item_details[:price]
    end

    puts "\nSales Taxes: #{total_sales_tax.to_s('F')}"
    puts "Total: #{total_cost.to_s('F')}"
  end
end

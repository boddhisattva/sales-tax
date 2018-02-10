require_relative '../lib/csv_parser'
require_relative '../lib/line_item'

file_name = 'input/shopping_basket2.csv'

products = CsvParser.new(file_name).read

line_items = products.each_with_object([]) do |line_item, items|
               items << LineItem.new(line_item["Product"], BigDecimal.new(line_item["Price"]), line_item["Quantity"].to_i)
             end

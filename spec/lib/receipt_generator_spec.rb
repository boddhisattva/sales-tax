describe ReceiptGenerator do
  describe '#generate' do
    context 'given a list of items and the total sales tax' do
      it 'prints receipt details' do
        file_name = 'input/shopping_basket3.csv'
        line_items = CsvParser.new(file_name).read
        items = line_items.each_with_object([]) do |line_item, items|
                  items << LineItem.new(line_item["Product"], BigDecimal.new(line_item["Price"]), line_item["Quantity"].to_i)
                end
        total_sales_tax = BigDecimal.new("6.7")

        receipt_generator = ReceiptGenerator.new

        expect {receipt_generator.generate(items, total_sales_tax)}.to output(purchase_receipt).to_stdout
      end
    end
  end
end

def purchase_receipt
  <<~PURCHASE_DETAILS
    1, imported bottle of perfume, 27.99
    1, bottle of perfume, 18.99
    1, packet of headache pills, 9.75
    1, imported box of chocolates, 11.25

    Sales Taxes: 6.7
    Total: 67.98
  PURCHASE_DETAILS
end

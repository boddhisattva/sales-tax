describe CsvParser do
  describe '#read' do
    context 'given a csv' do
      it 'returns row details with removed whitespaces for each value of the CSV' do
        file_name = 'input/shopping_basket2.csv'
        products = CsvParser.new(file_name).read

        line_items = [CSV::Row.new(["Quantity", "Product", "Price"], ["1", "imported box of chocolates", "10.00"], false),
                      CSV::Row.new(["Quantity", "Product", "Price"], ["1", "imported bottle of perfume", "47.50"], false)]

        expect(products).to match_array(line_items)
      end
    end
  end
end
# frozen_string_literal: true

describe CsvParser do
  describe '#read' do
    context 'given a csv' do
      it 'returns a collection of line items with removed whitespaces for each value of the CSV' do
        file_name = 'input/shopping_basket2.csv'
        products = CsvParser.new(file_name).read

        line_items = [LineItem.new('imported box of chocolates', BigDecimal.new('10.00'), 1),
                      LineItem.new('imported bottle of perfume', BigDecimal.new('47.50'), 1)]

        expect(products.first.details).to eq(line_items.first.details)
      end
    end
  end
end

# frozen_string_literal: true

describe LineItem do
  describe '#initialize' do
    it 'it determines whether a line item is imported, has basic sales tax applicable and also sets other related attributes' do
      line_item = LineItem.new('imported box of chocolates', BigDecimal('10'), 1)

      expect(line_item.imported).to be true
      expect(line_item.basic_sales_tax).to be false
    end
  end

  describe '#details' do
    context 'given an item' do
      it 'gets the item details as a collection' do
        line_item = LineItem.new('book', BigDecimal('6.5'), 4)

        expect(line_item.details).to eq(name: 'book',
                                        price: 6.5,
                                        quantity: 4,
                                        imported: false,
                                        basic_sales_tax: false)
      end
    end
  end
end

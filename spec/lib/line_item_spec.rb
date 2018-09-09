# frozen_string_literal: true

describe LineItem do
  describe '#initialize' do
    it 'it sets line item related attributes and also determines whether a line item is imported' do
      line_item = LineItem.new('imported box of chocolates', BigDecimal.new("10"), 1)

      expect(line_item.imported).to be true
    end
  end

  describe '#details' do
    context 'given an item with a name, price and quantity' do
      it 'gets the item details as a collection' do
        line_item = LineItem.new('book', BigDecimal.new('6.5'), 4)

        expect(line_item.details).to eq(name: 'book',
                                        price: 6.5,
                                        quantity: 4,
                                        imported: false)
      end
    end
  end
end

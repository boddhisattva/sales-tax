describe LineItem do
  describe '#details' do
    context 'given an item with a name, price and quantity' do
      it 'gets the item details as a collection' do
        line_item = LineItem.new("book", BigDecimal.new("6.5"), 4)

        expect(line_item.details).to eq({name: "book",
                                         price: 6.5,
                                         quantity: 4 })
      end
    end
  end
end

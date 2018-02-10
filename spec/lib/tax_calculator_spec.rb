describe TaxCalculator do
  describe '#calculate_tax' do
    context 'given an item with certain details' do
      it 'calculates item price inclusive of tax and total sales tax wrt the item' do
        item_details = {name: 'imported bottle of perfume', price: BigDecimal.new("27.99"), quantity: 1}

        tax_calculator = TaxCalculator.new

        expect(tax_calculator.calculate_tax(item_details)).to match_array([0.3219e2, 0.42e1])
      end
    end
  end
end
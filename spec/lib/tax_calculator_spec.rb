# frozen_string_literal: true

describe TaxCalculator do
  describe '#calculate_tax' do
    context 'given an item with certain details' do
      it 'calculates item price inclusive of tax and total sales tax wrt the item' do
        item = LineItem.new('imported bottle of perfume', BigDecimal('27.99'), 1)

        tax_calculator = TaxCalculator.new

        expect(tax_calculator.calculate_tax(item.details)).to match_array([0.3219e2, 0.42e1])
      end
    end
  end
end

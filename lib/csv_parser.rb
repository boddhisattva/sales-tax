# frozen_string_literal: true

require 'csv'

class CsvParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read
    row_details = []

    CSV.foreach(filename, headers: true,
                          header_converters: ->(value) { value.strip },
                          converters: ->(value) { value.strip }) do |row|

      row_details << LineItem.new(row['Product'], BigDecimal.new(row['Price']), row['Quantity'].to_i)
    end

    row_details
  end
end

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
                          header_converters: ->(value) { value.strip }, converters: ->(value) { value.strip }) do |row|
      row_details << row
    end

    row_details
  end
end

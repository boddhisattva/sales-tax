require 'csv'

class CsvParser
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def read
    row_details = []

    CSV.foreach(filename, headers: true,
      header_converters: lambda {|f| f.strip}, converters: lambda {|f| f.strip}) do |row|
      row_details << row
    end

    row_details
  end
end
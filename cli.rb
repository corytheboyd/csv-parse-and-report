#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'fileutils'

CSV_INPUT_PATH = 'input.csv'
OUTPUT_DIR = 'out'
OUTPUT_FILE_NAME = 'output.csv'
REPORT_FILE_NAME = 'report.txt'
HEADER_ROW = [
  'first_name',
  'last_name',
  'dob',
  'member_id',
  'effective_date',
  'expiry_date',
  'phone_number'
]

# @param [String] value
#
# @return [String]
def transform(value)
  value
end

# @param [Array<String>] row Input row of CSV data
#
# @return Array<String>
def transform_row(row)
  row.map { |value| transform(value) }
end

FileUtils.mkdir_p(OUTPUT_DIR)

CSV.open(File.join(OUTPUT_DIR, OUTPUT_FILE_NAME), "wb") do |out|
  out << HEADER_ROW

  CSV.foreach(CSV_INPUT_PATH) do |row|
    out << transform_row(row)
  end
end

File.open(File.join(OUTPUT_DIR, REPORT_FILE_NAME), 'wb') do |file|
  file << 'TODO implement report!'
end

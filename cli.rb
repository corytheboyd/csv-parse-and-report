#!/usr/bin/env ruby
# frozen_string_literal: true

require 'csv'
require 'fileutils'

# Loads application environment
require_relative 'config'

require 'lib/parser/date_time'
require 'lib/parser/phone_number'
require 'lib/parser/text'

CSV_INPUT_PATH = 'input.csv'
OUTPUT_DIR = 'out'
OUTPUT_FILE_NAME = 'output.csv'
REPORT_FILE_NAME = 'report.txt'

Header = Struct.new(:column, :parser)

HEADER_ROW_METADATA = [
  Header.new('first_name', Parser::Text),
  Header.new('last_name', Parser::Text),
  Header.new('dob', Parser::DateTime),
  Header.new('member_id', Parser::Text),
  Header.new('effective_date', Parser::DateTime),
  Header.new('expiry_date', Parser::Text),
  Header.new('phone_number', Parser::Text),
]

FileUtils.mkdir_p(OUTPUT_DIR)

CSV.open(File.join(OUTPUT_DIR, OUTPUT_FILE_NAME), "wb") do |out|
  out << HEADER_ROW_METADATA.map(&:column)

  CSV.foreach(CSV_INPUT_PATH) do |row|
    out << row.map.with_index do |value, index|
      HEADER_ROW_METADATA[index].parser.parse(value)
    end
  end
end

File.open(File.join(OUTPUT_DIR, REPORT_FILE_NAME), 'wb') do |file|
  file << 'TODO implement report!'
end

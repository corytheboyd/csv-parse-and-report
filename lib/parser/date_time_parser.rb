require 'date'

require 'lib/parser/result'

module Parser
  class DateTimeParser
    # Ideally, one would leverage DateTime::parse, but these inputs
    # yield unpredictable results verbatim.
    #
    # @param [String | nil] value
    #
    # @return [Parser::Result]
    def self.parse(value)
      result = Result.new

      return result unless value.is_a?(String)

      # Assume a M/D/Y formatted date
      month, day, year = value.split(/[^0-9]+/).map(&:to_i)

      # Detect if it was actually a Y/M/D date and swap values
      # accordingly
      if month > 12
        result.reports << "assuming Y/M/D instead of M/D/Y format"
        actual_day = year
        year = month
        month = day
        day = actual_day
      end

      # If we're dealing with anything less than four digit years,
      # interpret 00-21 as 2000-2021, and 22-99 as 1922-1999.
      if 0 <= year && year <= 21
        result.reports << "assuming 20xx from ambiguous year"
        year += 2000
      elsif 22 <= year && year <= 99
        result.reports << "assuming 19xx from ambiguous year"
        year += 1900
      end

      result.value = DateTime.new(year, month, day).iso8601
      result
    end
  end
end

require 'date'

module Parser
  class DateTimeParser
    # Ideally, one would leverage DateTime::parse, but these inputs
    # yield unpredictable results verbatim.
    #
    # @param [String | nil] value
    #
    # @return [String | nil]
    def self.parse(value)
      return nil unless value.is_a?(String)

      month, day, year = value.split(/[^0-9]+/).map(&:to_i)

      # If we're dealing with anything less than four digit years,
      # interpret 00-21 as 2000-2021, and 22-99 as 1922-1999.
      # TODO add to report that an ambiguous year was provided
      if 0 <= year && year <= 21
        year += 2000
      elsif 22 <= year && year <= 99
        year += 1900
      end

      unless year && month && day
        return nil
      end

      DateTime.new(year, month, day).iso8601
    end
  end
end

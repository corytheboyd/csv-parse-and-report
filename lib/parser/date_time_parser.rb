require 'date_time'

module Parser
  class DateTime
    # @param [String | nil] value
    #
    # @return [String | nil]
    def self.parse(value)
      return value unless value.is_a?(String)
      begin
        ::DateTime.parse(value, true).iso8601
      rescue Date::Error
        fallback_parse(value)
      end
    end

    def self.fallback_parse(value)
      month, day, year = value.split(/[^0-9]+/).map(&:to_i)

      unless year && month && day
        return nil
      end

      DateTime.new(year, month, day)
    end
    private_class_method :fallback_parse
  end
end

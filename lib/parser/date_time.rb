require 'date'

module Parser
  class DateTime
    # @param [String | nil] value
    #
    # @return [String | nil]
    def self.parse(value)
      return value unless value.is_a?(String)
      ::DateTime.parse(value).iso8601
    end
  end
end

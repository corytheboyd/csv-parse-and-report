require 'date'

module Parser
  class DateTime
    # @param [String] value
    #
    # @return [String]
    def self.parse(value)
      ::DateTime.parse(value).iso8601
    end
  end
end

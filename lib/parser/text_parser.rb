require 'lib/parser/result'

module Parser
  class TextParser
    # @param [String | nil] value
    #
    # @return [Parser::Result]
    def self.parse(value)
      result = Result.new

      unless value.is_a?(String)
        result.reports << "value not present"
        return result
      end

      result.value = value.strip
      result
    end
  end
end

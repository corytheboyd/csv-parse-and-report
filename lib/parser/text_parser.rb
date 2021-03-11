require 'lib/parser/result'

module Parser
  class TextParser
    # @param [String | nil] value
    #
    # @return [Parser::Result]
    def self.parse(value)
      result = Result.new

      return result unless value.is_a?(String)

      result.value = value.strip
      result
    end
  end
end

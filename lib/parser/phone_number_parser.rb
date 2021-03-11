require 'lib/parser/result'

module Parser
  class PhoneNumberParser
    PHONE_NUMBER_LENGTH = 10
    DEFAULT_COUNTRY_CODE = 1

    # @param [String | nil] value
    #
    # @return [Parser::Result]
    def self.parse(value)
      result = Result.new

      unless value.is_a?(String)
        result.reports << "value not present"
        return result
      end

      all_digits = value.gsub(/[^0-9]/, '')
      phone_digits = all_digits.slice(-1 * PHONE_NUMBER_LENGTH, all_digits.length)

      # If there are not enough digits to form a phone number,
      # slice returns nil
      if phone_digits.nil?
        result.reports << "failed to parse invalid phone number"
        return result
      end

      country_digits = all_digits.slice(0, all_digits.length - PHONE_NUMBER_LENGTH)

      # Default country code if not specified
      if country_digits.empty?
        result.reports << "country code not present, assuming default: #{DEFAULT_COUNTRY_CODE}"
        country_digits = DEFAULT_COUNTRY_CODE
      end

      result.value = "+#{country_digits}#{phone_digits}"
      result
    end
  end
end

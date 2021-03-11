module Parser
  class PhoneNumberParser
    PHONE_NUMBER_LENGTH = 10
    DEFAULT_COUNTRY_CODE = 1

    # @param [String | nil] value
    #
    # @return [String | nil]
    def self.parse(value)
      return value unless value.is_a?(String)

      all_digits = value.gsub(/[^0-9]/, '')
      phone_digits = all_digits.slice(-1 * PHONE_NUMBER_LENGTH, all_digits.length)

      # If there are not enough digits to form a phone number,
      # slice returns nil
      return nil if phone_digits.nil?

      country_digits = all_digits.slice(0, all_digits.length - PHONE_NUMBER_LENGTH)

      # Default country code if not specified
      if country_digits.empty?
        country_digits = DEFAULT_COUNTRY_CODE
      end

      "+#{country_digits}#{phone_digits}"
    end
  end
end

require 'lib/parser/phone_number_parser'

class TestParser_PhoneNumber < Minitest::Test
  def test_parse
    assert_nil Parser::PhoneNumberParser.parse(nil).value

    # Ensure that many raw formats are parsed correctly
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('(222) 333 4444').value
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('222-333-4444').value
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('12223334444').value
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('222 333 4444').value
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('1 222 333 4444').value
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('+1 222 333 4444').value

    # Ensure that many country codes are parsed correctly
    assert_equal '+998887776666', Parser::PhoneNumberParser.parse('+99 888 777 6666').value
    assert_equal '+54443332222', Parser::PhoneNumberParser.parse('+5 444 333 2222').value

    # Ensure that already formatted values are unchanged
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('+12223334444').value

    # Ensure that invalid phone numbers are filtered out
    assert_nil Parser::PhoneNumberParser.parse('12345').value

    # Ensure that reports are generated
    assert_equal ['failed to parse invalid phone number'], Parser::PhoneNumberParser.parse('12345').reports
    assert_equal ['country code not present, assuming default: 1'], Parser::PhoneNumberParser.parse('1231231234').reports
  end
end

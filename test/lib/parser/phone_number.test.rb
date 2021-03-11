require 'lib/parser/phone_number_parser'

class TestParser_PhoneNumber < Minitest::Test
  def test_parse
    # Ensure that many raw formats are parsed correctly
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('(222) 333 4444')
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('222-333-4444')
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('12223334444')
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('222 333 4444')
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('1 222 333 4444')
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('+1 222 333 4444')

    # Ensure that many country codes are parsed correctly
    assert_equal '+998887776666', Parser::PhoneNumberParser.parse('+99 888 777 6666')
    assert_equal '+54443332222', Parser::PhoneNumberParser.parse('+5 444 333 2222')

    # Ensure that already formatted values are unchanged
    assert_equal '+12223334444', Parser::PhoneNumberParser.parse('+12223334444')

    # Ensure that invalid phone numbers are filtered out
    assert_nil Parser::PhoneNumberParser.parse('12345')

    assert_nil Parser::PhoneNumberParser.parse(nil)
  end
end

require 'lib/parser/date_time_parser'

class TestParser_DateTime < Minitest::Test
  def test_parse
    assert_nil Parser::DateTimeParser.parse(nil)

    assert_equal '2021-01-01T00:00:00+00:00', Parser::DateTimeParser.parse('1/1/2021')
    assert_equal '2021-02-02T00:00:00+00:00', Parser::DateTimeParser.parse('2-2-2021')

    # When given ambiguous dates, do our best to parse them
    assert_equal '1922-01-01T00:00:00+00:00', Parser::DateTimeParser.parse('1/1/22')
    assert_equal '1989-02-02T00:00:00+00:00', Parser::DateTimeParser.parse('2/2/89')
    assert_equal '2012-03-03T00:00:00+00:00', Parser::DateTimeParser.parse('3/3/12')
    assert_equal '2021-04-04T00:00:00+00:00', Parser::DateTimeParser.parse('4/4/21')
  end
end

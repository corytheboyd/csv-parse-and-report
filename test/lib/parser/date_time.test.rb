require 'lib/parser/date_time_parser'

class TestParser_DateTime < Minitest::Test
  def test_parse
    assert_nil Parser::DateTimeParser.parse(nil).value

    # When given M/D/Y formatted dates
    assert_equal '2021-01-01T00:00:00+00:00', Parser::DateTimeParser.parse('1/1/2021').value
    assert_equal '2021-02-02T00:00:00+00:00', Parser::DateTimeParser.parse('2-2-2021').value

    # When given Y/M/D formatted dates
    assert_equal '2000-01-01T00:00:00+00:00', Parser::DateTimeParser.parse('2000/1/1').value

    # When given ambiguous dates, do our best
    assert_equal '1922-01-01T00:00:00+00:00', Parser::DateTimeParser.parse('1/1/22').value
    assert_equal '1989-02-02T00:00:00+00:00', Parser::DateTimeParser.parse('2-2-89').value
    assert_equal '2012-03-03T00:00:00+00:00', Parser::DateTimeParser.parse('3/3/12').value
    assert_equal '2021-04-04T00:00:00+00:00', Parser::DateTimeParser.parse('4.4.21').value
  end
end

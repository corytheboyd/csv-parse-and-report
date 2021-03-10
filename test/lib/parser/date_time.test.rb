require 'lib/parser/date_time'

class TestParser_DateTime < Minitest::Test
  def test_parse
    assert_equal '2021-01-01T00:00:00+00:00', Parser::DateTime.parse('1/1/2021')
    assert_equal '2021-02-02T00:00:00+00:00', Parser::DateTime.parse('2-2-2021')

    assert_nil Parser::DateTime.parse(nil)
  end
end

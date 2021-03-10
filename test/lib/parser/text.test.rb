require 'lib/parser/text'

class TestParser_Text < Minitest::Test
  def test_parse
    # It does not alter date-like string
    assert_equal '1/1/2021', Parser::Text.parse('1/1/2021')

    # It does not alter phone-like string
    assert_equal '(123) 456 7890', Parser::Text.parse('(123) 456 7890')

    assert_equal 'This is some RAW text', Parser::Text.parse('This is some RAW text')
    assert_nil Parser::Text.parse(nil)
  end
end

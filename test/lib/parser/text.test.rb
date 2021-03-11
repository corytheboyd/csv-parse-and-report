require 'lib/parser/text_parser'

class TestParser_Text < Minitest::Test
  def test_parse
    # It does not alter date-like string
    assert_equal '1/1/2021', Parser::TextParser.parse('1/1/2021').value

    # It does not alter phone-like string
    assert_equal '(123) 456 7890', Parser::TextParser.parse('(123) 456 7890').value

    assert_equal 'This is some RAW text', Parser::TextParser.parse('This is some RAW text').value
    assert_equal 'trim   outer', Parser::TextParser.parse('   trim   outer   ').value
    assert_nil Parser::TextParser.parse(nil).value

    # Ensure that reports are generated
    assert_equal ['value not present'], Parser::TextParser.parse(nil).reports
  end
end

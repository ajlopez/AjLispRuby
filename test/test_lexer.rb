require 'ajlisp'
require 'test/unit'

module AjLisp

class TestLexer < Test::Unit::TestCase
	def test_get_token
		source = StringSource.new "atom"
		lexer = Lexer.new source
		token = lexer.nextToken
		
		assert_not_nil token
		assert_equal "atom", token.value
		assert_equal TokenType::ATOM, token.type
	end
end

end
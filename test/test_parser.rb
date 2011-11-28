require 'ajlisp'
require 'test/unit'

module AjLisp

class TestParser < Test::Unit::TestCase
	def test_parse_atom		
		source = StringSource.new "atom"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? NamedAtom
		assert_equal "atom", expr.name
		
		assert_nil parser.parseExpression
	end
end

end
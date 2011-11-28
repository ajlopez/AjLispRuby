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

	def test_parse_list
		source = StringSource.new "(foo bar)"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal "foo", expr.first.name
		assert_equal "bar", expr.rest.first.name
		assert_nil expr.rest.rest
		
		assert_nil parser.parseExpression
	end
end

end
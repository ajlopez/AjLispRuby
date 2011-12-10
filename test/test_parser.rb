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
		assert_equal :atom, expr.name
		
		assert_nil parser.parseExpression
	end

	def test_parse_add_atom		
		source = StringSource.new "+"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? NamedAtom
		assert_equal :+, expr.name
		
		assert_nil parser.parseExpression
	end

	def test_parse_integer
		source = StringSource.new "123"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? Fixnum
		assert_equal 123, expr
		
		assert_nil parser.parseExpression
	end

	def test_parse_string
		source = StringSource.new '"foo"'
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? String
		assert_equal "foo", expr
		
		assert_nil parser.parseExpression
	end

	def test_parse_simple_list
		source = StringSource.new "(foo bar)"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal :foo, expr.first.name
		assert_equal :bar, expr.rest.first.name
		assert_nil expr.rest.rest
		
		assert_nil parser.parseExpression
	end

	def test_parse_add_list
		source = StringSource.new "(+ 1 2)"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal :+, expr.first.name
		assert_equal 1, expr.rest.first
		assert_equal 2, expr.rest.rest.first
		assert_nil expr.rest.rest.rest
		
		assert_nil parser.parseExpression
	end

	def test_parse_list_with_list
		source = StringSource.new "(cons (a b))"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal :cons, expr.first.name
		assert expr.rest.is_a? List
		
		assert_nil parser.parseExpression
	end

	def test_parse_list_with_two_lists
		source = StringSource.new "(cons (quote a) (quote (a b)))"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal :cons, expr.first.name
		assert expr.rest.is_a? List
		assert expr.rest.first.is_a? List
		assert expr.rest.rest.first.is_a? List
		
		assert_nil parser.parseExpression
	end

	def test_parse_verb_atom		
		source = StringSource.new ".do"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? DotVerbAtom
		assert_equal ".do".intern, expr.name
		
		assert_nil parser.parseExpression
	end

	def test_parse_constant_atom		
		source = StringSource.new "@String"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? AtConstantAtom
		assert_equal :@String, expr.name
		assert_equal "String", expr.constant
		
		assert_nil parser.parseExpression
	end

	def test_parse_quoted_atom
		source = StringSource.new "'a"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal :quote, expr.first.name
        assert_equal :a, expr.rest.first.name
		
		assert_nil parser.parseExpression
	end

	def test_parse_quoted_list
		source = StringSource.new "'(a b)"
		lexer = Lexer.new source
		parser = Parser.new lexer
		
		expr = parser.parseExpression
		
		assert_not_nil expr
		assert expr.is_a? List
		assert_equal :quote, expr.first.name
        assert_equal :a, expr.rest.first.first.name
        assert_equal :b, expr.rest.first.rest.first.name
		
		assert_nil parser.parseExpression
	end
end

end


require 'ajlisp'
require 'test/unit'

module AjLisp

class TestEvaluate < Test::Unit::TestCase
	def test_evaluate_integer
		result = evaluateText("1")
		
		assert_not_nil result
		assert result.is_a? Fixnum
		assert_equal 1, result
	end
	
	def test_evaluate_string
		result = evaluateText('"foo"')
		
		assert_not_nil result
		assert result.is_a? String
		assert_equal "foo", result
	end
	
	def test_evaluate_simple_quote
		result = evaluateText('(quote a)')
		
		assert_not_nil result
		assert result.is_a? NamedAtom
		assert_equal "a", result.name
	end
	
	def test_evaluate_quoted_list
		result = evaluateText('(quote (a b))')
		
		assert_not_nil result
		assert result.is_a? List
		assert_equal "a", result.first.name
		assert_equal "b", result.rest.first.name
		assert_nil result.rest.rest
	end

	def test_evaluate_simple_cons
		result = evaluateText('(cons (quote a) (quote (b)))')
		
		assert_not_nil result
		assert result.is_a? List
		assert_equal "a", result.first.name
		assert_equal "b", result.rest.first.name
		assert_nil result.rest.rest
	end
	
	def evaluateText(text)
		source = StringSource.new text
		lexer = Lexer.new source
		parser = Parser.new lexer
		expr = parser.parseExpression
		return AjLisp::evaluate AjLisp::context, expr
	end
end

end
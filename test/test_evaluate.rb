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
	
	def evaluateText(text)
		source = StringSource.new text
		lexer = Lexer.new source
		parser = Parser.new lexer
		expr = parser.parseExpression
		return AjLisp::evaluate AjLisp::context, expr
	end
end

end
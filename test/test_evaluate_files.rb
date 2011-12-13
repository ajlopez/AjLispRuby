require 'ajlisp'
require 'test/unit'

module AjLisp

class TestEvaluate < Test::Unit::TestCase
	def test_evaluate_define123
		result = evaluateFile("define123.lsp")
		
        assert_equal 3, result
        assert_equal 1, AjLisp::context.getValue(:one)
        assert_equal 2, AjLisp::context.getValue(:two)
        assert_equal 3, AjLisp::context.getValue(:three)
	end
	
	def test_evaluate_dodefine123
		result = evaluateFile("dodefine123.lsp")
		
        assert_equal 3, result
        assert_equal 1, AjLisp::context.getValue(:one)
        assert_equal 2, AjLisp::context.getValue(:two)
        assert_equal 3, AjLisp::context.getValue(:three)
	end
	
	def test_evaluate_mycons
		result = evaluateFile("mycons.lsp")
		
		assert_not_nil result
		assert result.is_a? List
		assert_equal :a, result.first.name
		assert_equal :b, result.rest.first.name
		assert_nil result.rest.rest
	end

	def test_evaluate_append
		evaluateFile("append.lsp")
		
        assert_equal "(1 2 3 4 5)", evaluateText("(append (list 1 2) (list 3 4 5))").to_s
        assert_equal "(1 2)", evaluateText("(append (list 1 2) nil)").to_s
        evaluateText("(define x '(b b))")
        assert_equal "(b b)", evaluateText("(append x nil)").to_s
        assert_equal "(b b b b)", evaluateText("(append x x)").to_s
	end

	def test_evaluate_mapfirst
		evaluateFile("mapfirst.lsp")
		
        assert_equal "((1) (2) (3))", evaluateText("(mapfirst list (list 1 2 3))").to_s
        assert_equal "(1 2 3)", evaluateText("(mapfirst first (quote ((1) (2) (3))))").to_s
	end
	
	def evaluateFile(filename)    
		source = FileSource.new File.expand_path(filename, File.dirname(__FILE__))
		lexer = Lexer.new source
		parser = Parser.new lexer
		expr = parser.parseExpression
        
        result = nil
        
        while expr
            result = AjLisp::evaluate AjLisp::context, expr
            expr = parser.parseExpression
        end
        
        return result
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
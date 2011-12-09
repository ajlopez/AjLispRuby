require 'ajlisp'
require 'test/unit'

module AjLisp

class TestEvaluate < Test::Unit::TestCase
	def test_evaluate_define123
		result = evaluateFile("define123.lsp")
		
        assert_equal 3, result
        assert_equal 1, AjLisp::context.getValue("one")
        assert_equal 2, AjLisp::context.getValue("two")
        assert_equal 3, AjLisp::context.getValue("three")
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
end

end
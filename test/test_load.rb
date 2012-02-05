require 'ajlisp'
require 'test/unit'

module AjLisp

class TestEvaluateLoad < Test::Unit::TestCase
  def test_evaluate_define123
    result = loadFile("define123.lsp")
		
    assert_equal 3, result
    assert_equal 1, AjLisp::context.getValue(:one)
    assert_equal 2, AjLisp::context.getValue(:two)
    assert_equal 3, AjLisp::context.getValue(:three)
  end

  def test_evaluate_dodefine123
    result = loadFile("dodefine123.lsp")
		
    assert_equal 3, result
    assert_equal 1, AjLisp::context.getValue(:one)
    assert_equal 2, AjLisp::context.getValue(:two)
    assert_equal 3, AjLisp::context.getValue(:three)
  end
	
  def test_evaluate_mycons
    result = loadFile("mycons.lsp")
    
    assert_not_nil result
    assert result.is_a? List
    assert_equal :a, result.first.name
    assert_equal :b, result.rest.first.name
    assert_nil result.rest.rest
  end

  def test_evaluate_append
    loadFile("append.lsp")
    
    assert_equal "(1 2 3 4 5)", evaluateText("(append (list 1 2) (list 3 4 5))").to_s
    assert_equal "(1 2)", evaluateText("(append (list 1 2) nil)").to_s
    evaluateText("(define x '(b b))")
    assert_equal "(b b)", evaluateText("(append x nil)").to_s
    assert_equal "(b b b b)", evaluateText("(append x x)").to_s
  end

  def test_evaluate_mapfirst
    loadFile("mapfirst.lsp")
		
    assert_equal "((1) (2) (3))", evaluateText("(mapfirst list (list 1 2 3))").to_s
    assert_equal "(1 2 3)", evaluateText("(mapfirst first (quote ((1) (2) (3))))").to_s
	end

  def test_evaluate_mapcond
    loadFile("mapcond.lsp")
		
    assert_equal "((2))", evaluateText("(mapcond list? (list 1 (list 2) 3))").to_s
    assert_equal "(nil)", evaluateText("(mapcond nil? (list 1 nil 3))").to_s
  end

  def loadFile(filename)
    fullname = File.expand_path(filename, File.dirname(__FILE__))
    text = '(load "' + fullname + '")'
    return evaluateText(text)
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
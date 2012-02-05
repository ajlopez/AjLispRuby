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

  def test_evaluate_mapcond
    evaluateFile("mapcond.lsp")
		
    assert_equal "((2))", evaluateText("(mapcond list? (list 1 (list 2) 3))").to_s
    assert_equal "(nil)", evaluateText("(mapcond nil? (list 1 nil 3))").to_s
  end

  def test_evaluate_definem
    evaluateFile("definem.lsp")

    evaluateText("(definem myquote (x) (list 'quote x))")
		
    assert_equal "x", evaluateText("(myquote x)").to_s
    assert_equal "(1 2 3)", evaluateText("(myquote (1 2 3))").to_s

    evaluateText("(definem myfirst (x) (list 'first x))")
		
    assert_equal "a", evaluateText("(myfirst '(a b c))").to_s
  end  

  def test_evaluate_cond
    evaluateFile("cond.lsp")    

    assert_equal false, evaluateText("(cond)")
    assert_equal false, evaluateText("(cond (nil 'a))")
    assert_equal "a", evaluateText("(cond (true 'a))").to_s
    assert_equal "b", evaluateText("(cond (nil 'a) (true 'b))").to_s
    assert_equal "c", evaluateText("(cond (nil 'a) (true 'b 'c))").to_s
	end

	def test_evaluate_and
		evaluateFile("cond.lsp")
		evaluateFile("and.lsp")

    assert_equal true, evaluateText("(and)")
    assert_equal true, evaluateText("(and true)")
    assert_equal false, evaluateText("(and true false)")
    assert_equal false, evaluateText("(and false)")
  end
  
  def test_evaluate_backquote
    evaluateFile("append.lsp")
    evaluateFile("definem.lsp")
    evaluateFile("cond.lsp")
    evaluateFile("and.lsp")
    evaluateFile("backquote.lsp")

    assert_equal "(a b c)", evaluateText("(backquote (a b c))").to_s
    assert_equal "(a (b c) d)", evaluateText("(backquote (a (b c) d))").to_s
    evaluateText("(define x '(b b))")
    assert_equal "(b b)", evaluateText("(backquote (unquote x))").to_s
    assert_equal "((b b))", evaluateText("(backquote ((unquote x)))").to_s
    assert_equal "(a (b b) c)", evaluateText("(backquote (a (unquote x) c))").to_s
    assert_equal "(a ((b b)) c)", evaluateText("(backquote (a ((unquote x)) c))").to_s

    assert_equal "(b b)", evaluateText("(backquote ((unquote-slice x)))").to_s
    assert_equal "(a b b c)", evaluateText("(backquote (a (unquote-slice x) c))").to_s
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
require 'ajlisp'
require 'test/unit'

class TestFPrimitiveClosure < Test::Unit::TestCase
    def test_new_with_no_context
        arguments = AjLisp::List.make [ :a, :b ]
        body = AjLisp::List.make [[ :cons, :a, :b ]]
        closure = AjLisp::FPrimitiveClosure.new arguments, body
        assert_equal arguments, closure.arguments
        assert_equal body, closure.body
        assert_nil closure.context
    end

    def test_evaluate_simple_body
        arguments = AjLisp::List.make [ :a, :b ]
        body = [ AjLisp::List.make([ :cons, :a, :b ])]
        closure = AjLisp::FPrimitiveClosure.new arguments, body
        list = AjLisp::List.make [closure, "a", [:b, :c]]
        
        result = closure.evaluate(AjLisp::context, list)
        
        assert_not_nil result
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_equal :b, result.rest.first.name
        assert_equal :c, result.rest.rest.first.name
        assert_nil result.rest.rest.rest
    end
end

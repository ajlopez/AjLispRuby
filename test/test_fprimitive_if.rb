require 'ajlisp'
require 'test/unit'

class TestFPrimitiveIf < Test::Unit::TestCase
    def test_evaluate_if_false
        ifform = AjLisp::FPrimitiveIf.instance
        list = AjLisp::List.make [ifform, false, [:define, :b1, 2], [:define, :c1, 3] ]

        result = ifform.evaluate(AjLisp::context, list)

        assert_not_nil result
        assert_equal 3, result
		assert_nil AjLisp::context.getValue("b1")
		assert_equal 3, AjLisp::context.getValue("c1")
    end

    def test_evaluate_if_true
        ifform = AjLisp::FPrimitiveIf.instance
        list = AjLisp::List.make [ifform, true, [:define, :b2, 2], [:define, :c2, 3] ]

        result = ifform.evaluate(AjLisp::context, list)

        assert_not_nil result
        assert_equal 2, result
		assert_equal 2, AjLisp::context.getValue("b2")
		assert_nil AjLisp::context.getValue("c2")
    end
end


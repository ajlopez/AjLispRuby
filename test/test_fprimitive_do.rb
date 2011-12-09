require 'ajlisp'
require 'test/unit'

class TestFPrimitiveDo < Test::Unit::TestCase
    def test_evaluate_simple_body
        doform = AjLisp::FPrimitiveDo.instance
        list = AjLisp::List.make [doform, [:define, :a, 1], [:define, :b, 2], [:define, :c, 3] ]

        result = doform.evaluate(AjLisp::context, list)

        assert_not_nil result
        assert_equal 3, result
		assert_equal 1, AjLisp::context.getValue("a")
		assert_equal 2, AjLisp::context.getValue("b")
		assert_equal 3, AjLisp::context.getValue("c")
    end
end


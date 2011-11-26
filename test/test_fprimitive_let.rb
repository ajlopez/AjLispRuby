require 'ajlisp'
require 'test/unit'

class TestFPrimitiveLet < Test::Unit::TestCase
    def test_evaluate_simple_body
        let = AjLisp::FPrimitiveLet.instance
        list = AjLisp::List.make [let, [[:a, 1], [:b, 2]], [:cons, :a, [:cons, :b]] ]

        result = let.evaluate(AjLisp::context, list)

        assert_not_nil result
        assert result.is_a? AjLisp::List
        assert_equal 1, result.first
        assert_equal 2, result.rest.first
		assert_nil result.rest.rest
    end
end


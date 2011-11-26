
require 'ajlisp'
require 'test/unit'

class TestFPrimitiveFLambda < Test::Unit::TestCase
	def test_evaluate
		list = AjLisp::List.make [[:flambda, [:a, :b], [:cons, :a, :b]], "a", [:b, :c]]
        result = list.evaluate(AjLisp::context)
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_equal "b", result.rest.first.name
        assert_equal "c", result.rest.rest.first.name
        assert_nil result.rest.rest.rest
	end
end

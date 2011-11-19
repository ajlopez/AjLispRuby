
require 'ajlisp'
require 'test/unit'

class TestPrimitiveRest < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a", AjLisp::List.new("b"))
		rest = AjLisp::PrimitiveRest.instance
		assert_equal("b", rest.apply(nil, [list]).first)
	end
	
	def test_simple_evaluate
		list = AjLisp::List.make [AjLisp::FPrimitiveQuote.instance, ["a", "b"]]
		form = AjLisp::List.make [AjLisp::PrimitiveRest.instance, list]
		result = form.evaluate(nil)
        assert result.is_a? AjLisp::List
		assert_equal "b", result.first
        assert_nil result.rest
	end
end

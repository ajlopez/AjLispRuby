
require 'ajlisp'
require 'test/unit'

class TestFPrimitiveQuote < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a")
		first = AjLisp::FPrimitiveQuote.instance
        result = first.apply(nil, [list])
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_nil result.rest
	end
	
	def test_simple_evaluate_with_name
		form = AjLisp::List.make [AjLisp::NamedAtom.new("quote"), ["a"]]
		result = form.evaluate(AjLisp::context)
        assert_not_nil result
		assert_equal "a", result.first
        assert_nil result.rest
	end
end

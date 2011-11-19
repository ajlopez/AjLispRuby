
require 'ajlisp'
require 'test/unit'

class TestPrimitiveFirst < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a")
		first = AjLisp::PrimitiveFirst.instance
		assert_equal("a", first.apply(nil, [list]))
	end
	
	def test_simple_evaluate
        quote = AjLisp::List.make [AjLisp::FPrimitiveQuote.instance, ["a"]]
		form = AjLisp::List.make [AjLisp::PrimitiveFirst.instance, quote]
		result = form.evaluate(nil)
		assert_equal("a", result)
	end
	
	def test_simple_evaluate_with_name
        quote = AjLisp::List.make [AjLisp::FPrimitiveQuote.instance, ["a"]]
		form = AjLisp::List.make [AjLisp::NamedAtom.new("first"), quote]
		result = form.evaluate(AjLisp::context)
		assert_equal("a", result)
	end
end

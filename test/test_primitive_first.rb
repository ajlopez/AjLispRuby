
require 'ajlisp'
require 'test/unit'

class TestPrimitiveFirst < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a")
		first = AjLisp::PrimitiveFirst.new
		assert_equal("a", first.apply(nil, [list]))
	end
	
	def test_simple_evaluate
        quote = AjLisp::List.make [AjLisp::FPrimitiveQuote.new, ["a"]]
		form = AjLisp::List.make [AjLisp::PrimitiveFirst.new, quote]
		result = form.evaluate(nil)
		assert_equal("a", result)
	end
end

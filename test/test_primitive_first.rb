
require 'ajlisp'
require 'test/unit'

class TestPrimitiveFirst < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a")
		first = AjLisp::PrimitiveFirst.new
		assert_equal("a", first.apply(nil, [list]))
	end
	
	def test_simple_evaluate
		list = AjLisp::List.new("a")
		form = AjLisp::List.new(AjLisp::PrimitiveFirst.new, AjLisp::List.new(list))		
		result = form.first.evaluate(nil, form)
		assert_equal("a", result)
	end
end

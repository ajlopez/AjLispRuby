
require 'ajlisp'
require 'test/unit'

class TestPrimitiveRest < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a", AjLisp::List.new("b"))
		rest = AjLisp::PrimitiveRest.new
		assert_equal("b", rest.apply(nil, [list]).first)
	end
	
	def test_simple_evaluate
		list = AjLisp::List.new("a", AjLisp::List.new("b"))
		form = AjLisp::List.new(AjLisp::PrimitiveRest.new, AjLisp::List.new(list))		
		result = form.first.evaluate(nil, form)
		assert_equal("b", result.first)
	end
end

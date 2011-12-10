
require 'ajlisp'
require 'test/unit'

module AjLisp

class TestFPrimitiveQuote < Test::Unit::TestCase
	def test_simple_apply
		list = List.new("a")
		quote = FPrimitiveQuote.instance
        result = quote.apply(nil, [list])
        assert result.is_a? List
        assert_equal "a", result.first
        assert_nil result.rest
	end
	
	def test_simple_evaluate_with_atom
		form = List.make [:quote, :a]
		result = form.evaluate(AjLisp::context)
        assert_not_nil result
		assert_equal :a, result.name
	end
	
	def test_simple_evaluate_with_list
		form = List.make [:quote, [:a, :b]]
		result = form.evaluate(AjLisp::context)
        assert_not_nil result
		assert result.is_a? List
		assert_equal :a, result.first.name
		assert_equal :b, result.rest.first.name
		assert_nil result.rest.rest
	end
end

end
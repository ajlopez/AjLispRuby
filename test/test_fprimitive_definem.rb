require 'ajlisp'
require 'test/unit'

class TestFPrimitiveDefinem < Test::Unit::TestCase
    def test_evaluate_definem_form
        list = AjLisp::List.make [:definem, :mycompose, [:a, :b], [:list, :a, :b]]
        
        result = list.evaluate(AjLisp::context)

		assert_not_nil AjLisp::context.getValue("mycompose")
        
        list = AjLisp::List.make [:mycompose, :first, [:quote, [:a, :b]]]
        result = list.evaluate(AjLisp::context)
        
        assert_not_nil result
		assert result.is_a? AjLisp::NamedAtom
        assert_equal "a", result.name
    end
end


require 'ajlisp'
require 'test/unit'

class TestFPrimitiveDefinef < Test::Unit::TestCase
    def test_evaluate_definef_form_myquote
        list = AjLisp::List.make [:definef, :myquote, [:x], :x]
        
        result = list.evaluate(AjLisp::context)

		assert_not_nil AjLisp::context.getValue(:myquote)
        
        list = AjLisp::List.make [:myquote, :a]
        result = list.evaluate(AjLisp::context)
        
        assert_not_nil result
		assert result.is_a? AjLisp::NamedAtom
        assert_equal :a, result.name
    end
end


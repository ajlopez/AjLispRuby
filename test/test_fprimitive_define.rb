require 'ajlisp'
require 'test/unit'

class TestFPrimitiveDefine < Test::Unit::TestCase
    def test_evaluate_define_atom_as_constant
        list = AjLisp::List.make [AjLisp::FPrimitiveDefine.instance, :a, 1]
        
        result = list.evaluate(AjLisp::context)

		assert_equal 1, result
		assert_equal 1, AjLisp::context.getValue("a")
    end

    def test_evaluate_define_two_atoms
        list = AjLisp::List.make [AjLisp::FPrimitiveDefine.instance, :a, 1]        
        result = list.evaluate(AjLisp::context)

        list = AjLisp::List.make [AjLisp::FPrimitiveDefine.instance, :b, :a]
        result = list.evaluate(AjLisp::context)

		assert_equal 1, result
		assert_equal 1, AjLisp::context.getValue("a")
		assert_equal 1, AjLisp::context.getValue("b")
    end

    def test_evaluate_define_atom_as_lambda
        list = AjLisp::List.make [AjLisp::FPrimitiveDefine.instance, :mycons, [:lambda, [:a, :b], [:cons, :a, :b]]]
        
        result = list.evaluate(AjLisp::context)

		assert result.is_a? AjLisp::PrimitiveClosure
		
		list = AjLisp::List.make [:mycons, 1, [:quote, [:b, :c]]]
		
		result = list.evaluate(AjLisp::context)
		
		assert_not_nil result
		assert result.is_a? AjLisp::List
		assert_equal 1, result.first
		assert_equal "b", result.rest.first.name
		assert_equal "c", result.rest.rest.first.name
		assert_nil result.rest.rest.rest
    end
end


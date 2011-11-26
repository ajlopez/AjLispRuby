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
end

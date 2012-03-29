
require 'ajlisp'
require 'test/unit'

class TestPrimitiveEval < Test::Unit::TestCase
    def test_simple_apply
        eval = AjLisp::PrimitiveEval.instance
        add = AjLisp::PrimitiveAdd.instance
        result = eval.apply(nil, [AjLisp::List.make([add, 1, 2])])
        assert result.is_a? Fixnum
        assert_equal 3, result
    end
end

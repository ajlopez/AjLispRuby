
require 'ajlisp'
require 'test/unit'

class TestPrimitiveAdd < Test::Unit::TestCase
    def test_simple_apply
        add = AjLisp::PrimitiveAdd.instance
        result = add.apply(nil, [1, 2])
        assert result.is_a? Fixnum
        assert_equal 3, result
    end

    def test_simple_to_one_number
        add = AjLisp::PrimitiveAdd.instance
        result = add.apply(nil, [1])
        assert result.is_a? Fixnum
        assert_equal 1, result
    end

    def test_simple_to_no_number
        add = AjLisp::PrimitiveAdd.instance
        result = add.apply(nil, [])
        assert result.is_a? Fixnum
        assert_equal 0, result
    end
end

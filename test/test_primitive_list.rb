
require 'ajlisp'
require 'test/unit'

module AjLisp

class TestPrimitiveList < Test::Unit::TestCase
    def test_simple_apply
        list = PrimitiveList.instance
        result = list.apply(nil, ["a", "b"])
        assert result.is_a? List
        assert_equal "a", result.first
		assert_equal "b", result.rest.first
        assert_nil result.rest.rest
    end

    def test_apply
        list = PrimitiveList.instance
        result = list.apply(nil, ["a", List.make(["b"])])
        assert result.is_a? List
        assert_equal "a", result.first
        assert_equal "b", result.rest.first.first
        assert_nil result.rest.rest
    end
end

end
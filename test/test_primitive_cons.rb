
require 'ajlisp'
require 'test/unit'

class TestPrimitiveCons < Test::Unit::TestCase
    def test_simple_apply
        cons = AjLisp::PrimitiveCons.new
        result = cons.apply(nil, ["a", nil])
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_nil result.rest
    end
    
    def test_simple_evaluate
        form = AjLisp::List.new(AjLisp::PrimitiveCons.new, AjLisp::List.new("a"))		
        result = form.first.evaluate(nil, form)
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_nil result.rest 
    end
end

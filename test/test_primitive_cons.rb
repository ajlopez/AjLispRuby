
require 'ajlisp'
require 'test/unit'

class TestPrimitiveCons < Test::Unit::TestCase
    def test_simple_apply
        cons = AjLisp::PrimitiveCons.instance
        result = cons.apply(nil, ["a", nil])
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_nil result.rest
    end

    def test_apply
        list = AjLisp::List.new "b"
        cons = AjLisp::PrimitiveCons.instance
        result = cons.apply(nil, ["a", list])
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_equal "b", result.rest.first
        assert_nil result.rest.rest
    end
    
    def test_simple_evaluate
        form = AjLisp::List.new(AjLisp::PrimitiveCons.instance, AjLisp::List.new("a"))		
        result = form.evaluate(nil)
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_nil result.rest 
    end
    
    def test_simple_evaluate_using_name
        form = AjLisp::List.new(AjLisp::NamedAtom.new("cons"), AjLisp::List.new("a"))		
        result = form.evaluate(AjLisp::context)
        assert result.is_a? AjLisp::List
        assert_equal "a", result.first
        assert_nil result.rest 
    end
end

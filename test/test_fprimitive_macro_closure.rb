require 'ajlisp'
require 'test/unit'

class TestFPrimitiveMacroClosure < Test::Unit::TestCase
    def test_evaluate_simple_body
        arguments = AjLisp::List.make [ :a, :b ]
        body = [ AjLisp::List.make([ :list, :a, :b ])]
        mclosure = AjLisp::FPrimitiveMacroClosure.new arguments, body
        list = AjLisp::List.make [mclosure, :first, [:quote, [:b, :c]]]
        
        result = mclosure.evaluate(AjLisp::context, list)
        
        assert_not_nil result
        assert result.is_a? AjLisp::NamedAtom
        assert_equal "b", result.name
    end
end

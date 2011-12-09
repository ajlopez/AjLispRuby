
require 'ajlisp'
require 'test/unit'

class TestFPrimitiveMLambda < Test::Unit::TestCase
	def test_evaluate
		list = AjLisp::List.make [[:mlambda, [:a, :b], [:list, :a, :b]], :first, [:quote, [:b, :c]]]
        result = list.evaluate AjLisp::context
        assert result.is_a? AjLisp::NamedAtom
        assert_equal "b", result.name
	end
end

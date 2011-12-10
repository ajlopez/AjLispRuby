
require 'ajlisp'
require 'test/unit'

module AjLisp

class TestDotVerbAtom < Test::Unit::TestCase
	def test_initialize
		atom = AjLisp::DotVerbAtom.new(".do")
		assert_equal ".do".intern, atom.name
        assert_equal :do, atom.symbol
	end

	def test_evaluate
		atom = AjLisp::DotVerbAtom.new(".do")
        method = atom.evaluate nil
        assert method.is_a? PrimitiveNativeMethod
	end

	def test_apply_arity_0
		atom = AjLisp::DotVerbAtom.new(".length")
        method = atom.evaluate nil
        result = method.apply(nil, ["foo"])
        assert_equal 3, result
	end
end

end


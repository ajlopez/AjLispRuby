
require 'ajlisp'
require 'test/unit'

module AjLisp

class TestAtConstantAtom < Test::Unit::TestCase
	def test_initialize
		atom = AjLisp::AtConstantAtom.new("@String")
		assert_equal "@String".intern, atom.name
        assert_equal "String", atom.constant
	end

	def test_initialize_with_colons
		atom = AjLisp::AtConstantAtom.new("@AjLisp::List")
		assert_equal "@AjLisp::List".intern, atom.name
        assert_equal "AjLisp::List", atom.constant
	end

	def test_evaluate
		atom = AjLisp::AtConstantAtom.new("@String")
        result = atom.evaluate nil
        assert_equal String, result
	end

	def test_nested_constant
		atom = AjLisp::AtConstantAtom.new("@AjLisp::List")
        result = atom.evaluate nil
        assert_equal AjLisp::List, result
	end
end

end


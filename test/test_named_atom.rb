
require 'ajlisp'
require 'test/unit'

class TestNamedAtom < Test::Unit::TestCase
	def test_initialize
		atom = AjLisp::NamedAtom.new("a")
		assert_equal(:a, atom.name)
	end
	
	def test_evaluate_in_context
		atom = AjLisp::NamedAtom.new("foo")
		context = AjLisp::Context.new
		context.setValue(:foo, "bar")
		assert_equal("bar", atom.evaluate(context))
	end 
end


require 'ajlisp'
require 'test/unit'

class TestContext < Test::Unit::TestCase
	def test_initialize
		context = AjLisp::Context.new
		assert_not_nil(context)
	end
	
	def test_not_defined_is_nil
		context = AjLisp::Context.new
		assert_nil(context.getValue("foo"))
	end
	
	def test_set_and_get_value
		context = AjLisp::Context.new
		context.setValue("foo", "bar")
		assert_equal("bar", context.getValue("foo"))
	end
	
	def test_get_value_from_parent
		parent = AjLisp::Context.new
		parent.setValue("foo", "bar")
		context = AjLisp::Context.new(parent)
		assert_equal("bar", context.getValue("foo"))
	end
	
	def test_override_value_from_parent
		parent = AjLisp::Context.new
		parent.setValue("foo", "bar")
		context = AjLisp::Context.new(parent)
		context.setValue("foo", "bar2")
		assert_equal("bar2", context.getValue("foo"))
		assert_equal("bar", parent.getValue("foo"))
	end
end

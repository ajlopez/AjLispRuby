
require 'ajlisp'
require 'test/unit'

class ListTest < Test::Unit::TestCase
	def test_initialize
		list = AjLisp::List.new
		assert_not_nil(list)
	end
	
	def test_first_is_nil
		list = AjLisp::List.new
		assert_nil(list.first)
	end
	
	def test_rest_is_nil
		list = AjLisp::List.new
		assert_nil(list.rest)
	end
	
	def test_create_with_first
		list = AjLisp::List.new("foo")
		assert_equal("foo", list.first)
		assert_nil(list.rest)
	end
	
	def test_create_with_first_and_rest
		rest = AjLisp::List.new("bar")
		list = AjLisp::List.new("foo", rest)
		assert_equal("foo", list.first)
		assert_not_nil(list.rest)
		assert_equal("bar", list.rest.first)
		assert_nil(list.rest.rest)
	end
end

class NamedAtomTest < Test::Unit::TestCase
	def test_initialize
		atom = AjLisp::NamedAtom.new("a")
		assert_equal("a", atom.name)
	end
	
	def test_evaluate_in_context
		atom = AjLisp::NamedAtom.new("foo")
		context = AjLisp::Context.new
		context.setValue("foo", "bar")
		assert_equal("bar", atom.evaluate(context))
	end 
end

class ContextTest < Test::Unit::TestCase
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

class PrimitiveFirstTest < Test::Unit::TestCase
	def test_simple_apply
		list = AjLisp::List.new("a")
		first = AjLisp::PrimitiveFirst.new
		assert_equal("a", first.apply(nil, [list]))
	end
	
	def test_simple_evaluate
		list = AjLisp::List.new("a")
		form = AjLisp::List.new(AjLisp::PrimitiveFirst.new, AjLisp::List.new(list))		
		result = form.first.evaluate(nil, form)
		assert_equal("a", result)
	end
end

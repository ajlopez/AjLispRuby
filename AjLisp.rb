
class List
	attr_reader :first
	attr_reader :rest
	
	def initialize(first=nil, rest=nil)
		@first = first
		@rest = rest
	end
end

class NamedAtom
	attr_reader :name
	
	def initialize(name)
		@name = name
	end
	
	def evaluate(context)
		return context.getValue(@name)
	end
end

class Context
	def initialize(parent = nil)
		@parent = parent
		@values = Hash.new
	end
	
	def getValue(name)
		if @values.has_key?(name)
			return @values[name]
		end
		
		if @parent != nil
			return @parent.getValue(name)
		end
		
		return nil
	end
	
	def setValue(name, value)
		@values[name] = value
	end
end

class Primitive
	def evaluate(context, list)
		args = []
		rest = list.rest
		
		while rest != nil
			# TODO evaluate the items
			args.push(rest.first)
			rest = rest.rest
		end
		
		return apply(context, args)
	end
end

class FirstPrimitive < Primitive	
	def apply(context, args)
		return args[0].first
	end
end

require 'test/unit'

class ListTest < Test::Unit::TestCase
	def test_initialize
		list = List.new
		assert_not_nil(list)
	end
	
	def test_first_is_nil
		list = List.new
		assert_nil(list.first)
	end
	
	def test_rest_is_nil
		list = List.new
		assert_nil(list.rest)
	end
	
	def test_create_with_first
		list = List.new("foo")
		assert_equal("foo", list.first)
		assert_nil(list.rest)
	end
	
	def test_create_with_first_and_rest
		rest = List.new("bar")
		list = List.new("foo", rest)
		assert_equal("foo", list.first)
		assert_not_nil(list.rest)
		assert_equal("bar", list.rest.first)
		assert_nil(list.rest.rest)
	end
end

class NamedAtomTest < Test::Unit::TestCase
	def test_initialize
		atom = NamedAtom.new("a")
		assert_equal("a", atom.name)
	end
	
	def test_evaluate_in_context
		atom = NamedAtom.new("foo")
		context = Context.new
		context.setValue("foo", "bar")
		assert_equal("bar", atom.evaluate(context))
	end 
end

class ContextTest < Test::Unit::TestCase
	def test_initialize
		context = Context.new
		assert_not_nil(context)
	end
	
	def test_not_defined_is_nil
		context = Context.new
		assert_nil(context.getValue("foo"))
	end
	
	def test_set_and_get_value
		context = Context.new
		context.setValue("foo", "bar")
		assert_equal("bar", context.getValue("foo"))
	end
	
	def test_get_value_from_parent
		parent = Context.new
		parent.setValue("foo", "bar")
		context = Context.new(parent)
		assert_equal("bar", context.getValue("foo"))
	end
	
	def test_override_value_from_parent
		parent = Context.new
		parent.setValue("foo", "bar")
		context = Context.new(parent)
		context.setValue("foo", "bar2")
		assert_equal("bar2", context.getValue("foo"))
		assert_equal("bar", parent.getValue("foo"))
	end
end

class FirstPrimitiveTest < Test::Unit::TestCase
	def test_simple_apply
		list = List.new("a")
		first = FirstPrimitive.new
		assert_equal("a", first.apply(nil, [list]))
	end
	
	def test_simple_evaluate
		list = List.new("a")
		form = List.new(FirstPrimitive.new, List.new(list))		
		result = form.first.evaluate(nil, form)
		assert_equal("a", result)
	end
end


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


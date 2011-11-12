
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
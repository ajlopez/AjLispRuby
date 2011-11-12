
class List
	attr_accessor :first
	attr_accessor :rest
	
	def initialize(first=nil, rest=nil)
		@first = first
		@rest = rest
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
		list = List.new("foo", list)
		assert_equal("foo", list.first)
		assert_not_nil(list.rest)
		assert_equal("bar", list.rest)
		assert_nil(list.rest.first)
	end
end
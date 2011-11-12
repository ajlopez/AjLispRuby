
class List
	attr_accessor :first
	attr_accessor :rest
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
end
require 'ajlisp'
require 'test/unit'

class TestList < Test::Unit::TestCase
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

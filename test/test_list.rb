require 'ajlisp'
require 'test/unit'

module AjLisp

class TestList < Test::Unit::TestCase
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
    
    def test_create_from_array
        list = List.make [1, "a", "foo"]
        assert_not_nil list
        assert_equal 1, list.first
        assert_equal "a", list.rest.first
        assert_equal "foo", list.rest.rest.first
        assert_nil list.rest.rest.rest
    end
    
    def test_create_from_nested_array
        list = List.make [1, ["a", "b"], "foo"]
        assert_not_nil list
        assert_equal 1, list.first
        
        assert_equal "a", list.rest.first.first
        assert_equal "b", list.rest.first.rest.first
        assert_nil list.rest.first.rest.rest
        
        assert_equal "foo", list.rest.rest.first
        assert_nil list.rest.rest.rest
    end
    
    def test_create_from_array_with_symbols
        list = List.make [1, :a, :foo]
        assert_not_nil list
        assert_equal 1, list.first
        assert list.rest.first.is_a? AjLisp::NamedAtom
        assert_equal :a, list.rest.first.name
        assert list.rest.rest.first.is_a? AjLisp::NamedAtom
        assert_equal :foo, list.rest.rest.first.name
    end
	
	def test_simple_list_to_string
		list = List.make [:a, :b]
		assert_equal "(a b)", list.to_s
	end
	
	def test_nested_list_to_string
		list = List.make [:a, [:b, :c, [:d, :e]], :f]
		assert_equal "(a (b c (d e)) f)", list.to_s
	end
	
	def test_list_with_numbers_and_strings_to_string
		list = List.make [:a, ["b", 2, [:d, :e]], :f]
		assert_equal '(a ("b" 2 (d e)) f)', list.to_s
	end
    
    def test_simple_list_is_equal_to_list
        list = List.make [:a, :b]
        list2 = List.make [:a, :b]
        list3 = List.make [:a, :c]
        assert list.isEqualTo(list2)
        assert !list.isEqualTo(list3)
        assert !list3.isEqualTo(list)
        assert list.isEqualTo(list)
        assert list2.isEqualTo(list)
    end
    
    def test_empty_list
        list = List.make []
        
        assert_nil list
    end
end

end
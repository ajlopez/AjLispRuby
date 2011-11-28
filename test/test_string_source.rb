
require 'ajlisp'
require 'test/unit'

class TestStringSource < Test::Unit::TestCase
	def test_next_char
		source = AjLisp::StringSource.new "a"
		assert 'a', source.nextChar
	end
end
require 'ajlisp'
require 'test/unit'

class TestFileSource < Test::Unit::TestCase
	def test_next_char
		source = AjLisp::FileSource.new __FILE__
		assert 'r', source.nextChar
		assert 'e', source.nextChar
		assert 'q', source.nextChar
	end
end
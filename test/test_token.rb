require 'ajlisp'
require 'test/unit'

module AjLisp

class TestToken < Test::Unit::TestCase
	def test_create_token
		token = Token.new "atom", TokenType::ATOM
		assert_equal "atom", token.value
		assert_equal TokenType::ATOM, token.type
	end
end

end
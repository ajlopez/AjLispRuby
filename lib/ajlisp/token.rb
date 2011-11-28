
module AjLisp

class Token
	attr_reader :value
	attr_reader :type
	
	def initialize(value, type)
		@value = value
		@type = type
	end
end

class TokenType
	INTEGER = 1
	REAL = 2
	STRING = 3
	ATOM = 4
	SEPARATOR = 5
end

end


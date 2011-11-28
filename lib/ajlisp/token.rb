
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
	STRING = 2
	ATOM = 3
	SEPARATOR = 4
end

end


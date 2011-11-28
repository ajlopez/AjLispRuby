

module AjLisp

class Parser
	def initialize(lexer)
		@lexer = lexer
	end
	
	def parseExpression
		token = @lexer.nextToken
		
		if token == nil
			return nil
		end
		
		if token.type == TokenType::ATOM
			return NamedAtom.new token.value
		end
	end
end

end
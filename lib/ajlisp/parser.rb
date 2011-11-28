

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
		
		if token.type == TokenType::SEPARATOR and token.value == "("
			elements = []
			token = @lexer.nextToken
			
			while not (token.type == TokenType::SEPARATOR or token.value == ")")
				@lexer.pushToken token
				elements.push parseExpression
				token = @lexer.nextToken
			end
			
			return List::make elements
		end
	end
end

end
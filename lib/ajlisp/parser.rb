

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
            if token.value[0,1] == "."
                return DotVerbAtom.new token.value
            end
            
            if token.value[0,1] == "@"
                return AtConstantAtom.new token.value
            end
            
            if token.value[0,1] == "'"
                return List.make [NamedAtom.new("quote"), parseExpression]
            end
            
            if token.value[0,1] == "`"
                return List.make [NamedAtom.new("backquote"), parseExpression]
            end

            if token.value[0,1] == ","
                return List.make [NamedAtom.new("unquote"), parseExpression]
            end
            
            if token.value == "false"
                return false
            end
            
            if token.value == "true"
                return true
            end
            
            if token.value == "nil"
                return NilAtom.instance
            end

            return NamedAtom.new token.value
        end
        
        if token.type == TokenType::INTEGER
            return token.value.to_i
        end
        
        if token.type == TokenType::STRING
            return token.value
        end
        
        if token.type == TokenType::SEPARATOR and token.value == "("
            elements = []
            token = @lexer.nextToken
            
            while not (token.type == TokenType::SEPARATOR and token.value == ")")
                @lexer.pushToken token
                elements.push parseExpression
                token = @lexer.nextToken
            end

            if elements.length == 0
                return EmptyList.instance
            else
                return List::make elements
            end
        end
    end
end

end
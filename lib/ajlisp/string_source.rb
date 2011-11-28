
module AjLisp

class StringSource	
	def initialize(text)
		@text = text
		@position = 0
		@chars = []
	end
	
	def nextChar
		char = @chars.pop
		
		if char
			return char
		end
	
		char = @text[@position]
		@position += 1
		return char
	end
	
	def pushChar(ch)
		@chars.push ch
	end
end

end
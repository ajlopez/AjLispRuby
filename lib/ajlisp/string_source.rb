
module AjLisp

class StringSource	
	def initialize(text)
		@text = text
		@position = 0
	end
	
	def nextChar
		char = @text[@position]
		@position += 1
		return char
	end
end

end
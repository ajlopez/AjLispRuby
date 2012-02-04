
module AjLisp

	class InputSource	
		def initialize
			@line = ""
			@position = 0
			@chars = []
		end
		
		def nextChar
			char = @chars.pop
			
			if char
				return char
			end
		
			while @line.length <= @position
				@line = gets
				@position = 0

				if @line == nil
						return nil
				end				
			end

			char = @line[@position]
			@position += 1
			return char
		end
		
		def pushChar(ch)
			@chars.push ch
		end
	end

end
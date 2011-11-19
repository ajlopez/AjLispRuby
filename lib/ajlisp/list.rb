
module AjLisp

class List
	attr_reader :first
	attr_reader :rest
	
	def initialize(first=nil, rest=nil)
		@first = first
		@rest = rest
	end
end

end
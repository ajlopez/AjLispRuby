
module AjLisp

class List
	attr_reader :first
	attr_reader :rest
	
	def initialize(first=nil, rest=nil)
		@first = first
		@rest = rest
	end
    
    def evaluate(context)
        first = @first.evaluate(context)
        first.evaluate(context, self)
    end
end

end
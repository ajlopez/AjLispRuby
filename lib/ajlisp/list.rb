
module AjLisp

class List
    attr_reader :first
    attr_reader :rest
    
    def initialize(first=nil, rest=nil)
        @first = first
        @rest = rest
    end
    
    def evaluate(context)
        form = AjLisp::evaluate(context, @first)
        form.evaluate(context, self)
    end
	
	def to_s
		result = "("
		
		result += @first.to_s
		
		rest = @rest
		
		while rest
			result += " "
			result += rest.first.to_s
			rest = rest.rest
		end
		
		result += ")"
		
		return result
	end
    
    def self.make(array)
        if array and array.length > 0
            first = array.shift
            
            if first.is_a? Array
                first = make(first)
            elsif first.is_a? Symbol
                first = NamedAtom.new first
            end
                        
            return List.new first, make(array)
        end 
        
        return nil
    end
end

end
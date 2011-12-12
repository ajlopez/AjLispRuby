
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
        
        first = @first
        
        if first.is_a? String
            result += '"' + first + '"'
        else
            result += first.to_s
        end
        
        rest = @rest
        
        while rest
            result += " "
            first = rest.first
            if first.is_a? String
                result += '"' + first + '"'
            else
                result += first.to_s
            end
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
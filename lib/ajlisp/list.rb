
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
    
    def isEqualTo(list)
        if not list.is_a? List
            return false
        end
        
        if @first != list.first
            if @first.is_a? List or @first.is_a? NamedAtom
                if !@first.isEqualTo(list.first)
                    return false
                end
            else
                return false
            end
        end
        
        if @rest == nil and list.rest == nil
            return true
        end
        
        if @rest.is_a? List
            return @rest.isEqualTo(list.rest)
        end
        
        return false
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
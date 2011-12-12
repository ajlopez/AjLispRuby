
module AjLisp

class PrimitiveNilPredicate < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
        return args[0] == nil
	end
end

class PrimitiveAtomPredicate < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
        if args[0] == nil
            return false
        end
        
        if args[0].is_a? List
            return false
        end
        
        return true
	end
end

class PrimitiveListPredicate < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
        return args[0].is_a? List
	end
end

end


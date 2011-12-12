
module AjLisp

class PrimitiveEqual < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
        if args[0].is_a? List or args[0].is_a? NamedAtom
            return args[0].isEqualTo(args[1])
        end
    
		return args[0] == args[1]
	end
end

class PrimitiveLess < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		return args[0] < args[1]
	end
end

class PrimitiveGreater < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		return args[0] > args[1]
	end
end

class PrimitiveLessEqual < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		return args[0] <= args[1]
	end
end

class PrimitiveGreaterEqual < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		return args[0] >= args[1]
	end
end

end

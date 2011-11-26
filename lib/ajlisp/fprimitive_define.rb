
module AjLisp

class FPrimitiveDefine < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
        atom = args[0]
		value = AjLisp::evaluate(context, args[1])
		AjLisp::context.setValue atom.name, value
		return value
    end
end

end

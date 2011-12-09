
module AjLisp

class FPrimitiveDefinef < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
        atom = args[0]
		
		if args.length > 2
			args.shift
			arguments = args.shift
			value = AjLisp::FPrimitiveClosure.new arguments, args
		else
			value = AjLisp::evaluate(context, args[1])
		end

		AjLisp::context.setValue atom.name, value
		return value
    end
end

end

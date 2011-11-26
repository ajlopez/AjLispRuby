
module AjLisp

class FPrimitiveLet < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
        arguments = args[0]
        args.shift
		
		newcontext = AjLisp::Context.new context
		
		while arguments
			pair = arguments.first
			atom = pair.first
			value = AjLisp::evaluate(context, pair.rest.first)
			newcontext.setValue atom.name, value
			arguments = arguments.rest
		end
		
		result = nil
		
		args.each do |arg|
			result = arg.evaluate newcontext
		end

		return result
    end
end

end

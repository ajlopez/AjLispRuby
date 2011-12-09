
module AjLisp

class FPrimitiveIf < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
        condition = args[0]
        args.shift
        thenform = args[0]
        args.shift
        
        if AjLisp::evaluate context, condition
            return AjLisp::evaluate context, thenform
        end
        
		result = nil
		
		args.each do |arg|
			result = AjLisp::evaluate context, arg
		end

		return result
    end
end

end

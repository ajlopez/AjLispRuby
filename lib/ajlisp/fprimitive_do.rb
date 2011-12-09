
module AjLisp

class FPrimitiveDo < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
		result = nil
		
		args.each do |arg|
			result = arg.evaluate context
		end

		return result
    end
end

end

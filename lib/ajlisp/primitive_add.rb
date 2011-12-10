
module AjLisp

class PrimitiveAdd < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		result = 0
        
        if args.length > 0 and not args[0].is_a? Numeric
            result = ""
        end
		
		args.each do |arg|
			result += arg
		end
		
		return result
	end
end

end

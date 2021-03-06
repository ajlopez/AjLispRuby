
module AjLisp

class PrimitiveMultiply < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		result = 1
		
		args.each do |arg|
			result *= arg
		end
		
		return result
	end
end

end

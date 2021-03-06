
module AjLisp

class PrimitiveRest < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end

	def apply(context, args)
		return args[0].rest
	end
end

end

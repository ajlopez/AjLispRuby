
module AjLisp

class PrimitiveEval < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end

	def apply(context, args)
        return AjLisp::evaluate context, args[0]
	end
end

end


module AjLisp

class PrimitiveFirst < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end

	def apply(context, args)
		return args[0].first
	end
end

end


module AjLisp

class PrimitiveList < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		return List.make args
	end
end

end

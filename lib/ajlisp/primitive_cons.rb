
module AjLisp

class PrimitiveCons < Primitive	
    private_class_method :new
    
    @@instance = nil
    
    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
	def apply(context, args)
		return List.new(args[0], args[1])
	end
end

end

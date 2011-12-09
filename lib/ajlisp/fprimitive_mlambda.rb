
module AjLisp

class FPrimitiveMLambda < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
        arguments = args[0]
        args.shift
        return FPrimitiveMacroClosure.new arguments, args, context
    end
end

end

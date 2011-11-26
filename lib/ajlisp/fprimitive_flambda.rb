
module AjLisp

class FPrimitiveFLambda < FPrimitive	
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def apply(context, args)
        arguments = args[0]
        args.shift
        return FPrimitiveClosure.new arguments, args, context
    end
end

end

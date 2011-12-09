
module AjLisp

class FPrimitiveMacroClosure < FPrimitiveClosure
    
    def apply(context, args)
        result = super(context, args)
        return AjLisp::evaluate context, result
    end

    end

end

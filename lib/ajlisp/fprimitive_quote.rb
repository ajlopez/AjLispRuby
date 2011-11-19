
module AjLisp

class FPrimitiveQuote < FPrimitive	
	def apply(context, args)
        return args[0]
	end
end

end

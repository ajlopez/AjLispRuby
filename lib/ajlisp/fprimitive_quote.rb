
module AjLisp

class PrimitiveQuote < FPrimitive	
	def apply(context, args)
        return args[0]
	end
end

end

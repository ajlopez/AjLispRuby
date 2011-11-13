
module AjLisp

class PrimitiveRest < Primitive	
	def apply(context, args)
		return args[0].rest
	end
end

end

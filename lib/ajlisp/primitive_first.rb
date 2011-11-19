
module AjLisp

class PrimitiveFirst < Primitive	
	def apply(context, args)
		return args[0].first
	end
end

end

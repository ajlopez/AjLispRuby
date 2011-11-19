
module AjLisp

class PrimitiveCons < Primitive	
	def apply(context, args)
		return List.new(args[0], args[1])
	end
end

end

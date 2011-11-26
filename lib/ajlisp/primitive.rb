
module AjLisp

class Primitive
	def evaluate(context, list)
		args = []
		rest = list.rest
		
		while rest != nil
			args.push(AjLisp::evaluate(context, rest.first))
			rest = rest.rest
		end
		
		return apply(context, args)
	end
end

end


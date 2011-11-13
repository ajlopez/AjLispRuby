
module AjLisp

class Primitive
	def evaluate(context, list)
		args = []
		rest = list.rest
		
		while rest != nil
			# TODO evaluate the items
			args.push(rest.first)
			rest = rest.rest
		end
		
		return apply(context, args)
	end
end

end


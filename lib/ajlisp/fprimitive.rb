
module AjLisp

class FPrimitive
	def evaluate(context, list)
        if list == nil
            return self
        end
    
		args = []
		rest = list.rest
		
		while rest != nil
			args.push(rest.first)
			rest = rest.rest
		end
		
		return apply(context, args)
	end
end

end


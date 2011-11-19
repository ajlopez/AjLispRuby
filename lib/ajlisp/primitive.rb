
module AjLisp

class Primitive
	def evaluate(context, list)
		args = []
		rest = list.rest
		
		while rest != nil
			args.push(Primitive::evaluateItem(context, rest.first))
			rest = rest.rest
		end
		
		return apply(context, args)
	end
    
    def self.evaluateItem(context, item)
        if item != nil and (item.is_a? List or item.is_a? NamedAtom)
            return item.evaluate(context)
        end
        
        return item
    end
end

end


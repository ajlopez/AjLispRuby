
module AjLisp

class NamedAtom
    attr_reader :name
    
    def initialize(name)
        if name.is_a? String
            @name = name.intern
        elsif name.is_a? Symbol
            @name = name
        else
            raise "Name of Atom should be an String or Sysmbol"
        end
    end
    
    def evaluate(context)
        return context.getValue(@name)
    end
	
	def to_s
		return @name.to_s
	end
    
    def isEqualTo(atom)
        if !atom.is_a? NamedAtom
            return false
        end
        
        return @name == atom.name
    end
end

end
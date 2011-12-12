
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
end

end

module AjLisp

class NamedAtom
    attr_reader :name
    
    def initialize(name)
        @name = name
    end
    
    def evaluate(context)
        return context.getValue(@name)
    end
end

end
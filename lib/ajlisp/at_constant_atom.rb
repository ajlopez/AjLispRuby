
module AjLisp

class AtConstantAtom < NamedAtom
    attr_reader :constant
    
    def initialize(name)
        super(name)
        @constant = name[1,name.length]
        words = @constant.split("::")

        @symbols = []
        
        words.each do |word|
            @symbols.push word.intern
        end
    end
    
    def evaluate(context)
        result = Object
        
        @symbols.each do |symbol|
            result = result.const_get symbol
        end
        
        return result
    end
end

end
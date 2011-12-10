
module AjLisp

class DotVerbAtom < NamedAtom
    attr_reader :symbol
    
    def initialize(name)
        super(name)
        @symbol = name[1,name.length].intern
        @method = PrimitiveNativeMethod.new @symbol
    end
    
    def evaluate(context)
        return @method
    end
end

class PrimitiveNativeMethod < Primitive
    attr_reader :symbol
    
    def initialize(symbol)
        @symbol = symbol
    end
    
    def apply(context, args)
        target = args.shift
        target.send(@symbol, *args)
    end
end

end

require 'ajlisp/list.rb'
require 'ajlisp/named_atom.rb'
require 'ajlisp/context.rb'

require 'ajlisp/primitive.rb'
require 'ajlisp/primitive_first.rb'
require 'ajlisp/primitive_rest.rb'
require 'ajlisp/primitive_cons.rb'
require 'ajlisp/primitive_closure.rb'

require 'ajlisp/fprimitive.rb'
require 'ajlisp/fprimitive_quote.rb'
require 'ajlisp/fprimitive_lambda.rb'
require 'ajlisp/fprimitive_flambda.rb'
require 'ajlisp/fprimitive_let.rb'
require 'ajlisp/fprimitive_closure.rb'

module AjLisp

@context = Context.new
@context.setValue "quote", FPrimitiveQuote.instance
@context.setValue "first", PrimitiveFirst.instance
@context.setValue "rest", PrimitiveRest.instance
@context.setValue "cons", PrimitiveCons.instance
@context.setValue "lambda", FPrimitiveLambda.instance
@context.setValue "flambda", FPrimitiveFLambda.instance
@context.setValue "let", FPrimitiveLet.instance

def self.context
    return @context
end

def self.evaluate(context, item)
    if item.is_a? List or item.is_a? NamedAtom
        return item.evaluate(context)
    end
        
    return item	
end

end
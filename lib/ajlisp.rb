
require 'ajlisp/list.rb'
require 'ajlisp/named_atom.rb'
require 'ajlisp/context.rb'

require 'ajlisp/primitive.rb'
require 'ajlisp/primitive_first.rb'
require 'ajlisp/primitive_rest.rb'
require 'ajlisp/primitive_cons.rb'

require 'ajlisp/fprimitive.rb'
require 'ajlisp/fprimitive_quote.rb'

module AjLisp

@context = Context.new
@context.setValue "quote", FPrimitiveQuote.instance
@context.setValue "first", PrimitiveFirst.instance
@context.setValue "rest", PrimitiveRest.instance
@context.setValue "cons", PrimitiveCons.instance

def self.context
    return @context
end

end
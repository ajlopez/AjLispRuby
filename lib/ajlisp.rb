
require 'ajlisp/list.rb'
require 'ajlisp/named_atom.rb'
require 'ajlisp/context.rb'
require 'ajlisp/string_source.rb'
require 'ajlisp/file_source.rb'
require 'ajlisp/token.rb'
require 'ajlisp/lexer.rb'
require 'ajlisp/parser.rb'

require 'ajlisp/primitive.rb'
require 'ajlisp/primitive_first.rb'
require 'ajlisp/primitive_rest.rb'
require 'ajlisp/primitive_cons.rb'
require 'ajlisp/primitive_list.rb'
require 'ajlisp/primitive_closure.rb'

require 'ajlisp/dot_verb_atom.rb'
require 'ajlisp/at_constant_atom.rb'

require 'ajlisp/fprimitive.rb'
require 'ajlisp/fprimitive_quote.rb'
require 'ajlisp/fprimitive_lambda.rb'
require 'ajlisp/fprimitive_flambda.rb'
require 'ajlisp/fprimitive_mlambda.rb'
require 'ajlisp/fprimitive_let.rb'
require 'ajlisp/fprimitive_closure.rb'
require 'ajlisp/fprimitive_macro_closure.rb'
require 'ajlisp/fprimitive_define.rb'
require 'ajlisp/fprimitive_do.rb'
require 'ajlisp/fprimitive_if.rb'
require 'ajlisp/fprimitive_definef.rb'
require 'ajlisp/fprimitive_definem.rb'

require 'ajlisp/primitive_add.rb'
require 'ajlisp/primitive_subtract.rb'
require 'ajlisp/primitive_multiply.rb'
require 'ajlisp/primitive_divide.rb'

require 'ajlisp/primitive_comparisons.rb'
require 'ajlisp/primitive_predicates.rb'

module AjLisp

@context = Context.new

@context.setValue :quote, FPrimitiveQuote.instance
@context.setValue :first, PrimitiveFirst.instance
@context.setValue :rest, PrimitiveRest.instance
@context.setValue :cons, PrimitiveCons.instance
@context.setValue :list, PrimitiveList.instance
@context.setValue :lambda, FPrimitiveLambda.instance
@context.setValue :flambda, FPrimitiveFLambda.instance
@context.setValue :mlambda, FPrimitiveMLambda.instance
@context.setValue :let, FPrimitiveLet.instance
@context.setValue :define, FPrimitiveDefine.instance
@context.setValue :do, FPrimitiveDo.instance
@context.setValue :if, FPrimitiveIf.instance
@context.setValue :definef, FPrimitiveDefinef.instance
@context.setValue :definem, FPrimitiveDefinem.instance

@context.setValue :+, PrimitiveAdd.instance
@context.setValue :-, PrimitiveSubtract.instance
@context.setValue :*, PrimitiveMultiply.instance
@context.setValue :/, PrimitiveDivide.instance

@context.setValue :"=", PrimitiveEqual.instance
@context.setValue :"<", PrimitiveLess.instance
@context.setValue :">", PrimitiveGreater.instance
@context.setValue :"<=", PrimitiveLessEqual.instance
@context.setValue :">=", PrimitiveGreaterEqual.instance

@context.setValue :"nil?", PrimitiveNilPredicate.instance
@context.setValue :"atom?", PrimitiveAtomPredicate.instance
@context.setValue :"list?", PrimitiveListPredicate.instance

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
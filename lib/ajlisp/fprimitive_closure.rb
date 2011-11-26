
module AjLisp

class FPrimitiveClosure < FPrimitive
    attr_reader :arguments
    attr_reader :body
    attr_reader :context
    
    def initialize(arguments, body, context=nil)
        @arguments = arguments
        @body = body
        @context = context
    end
    
    def apply(context, args)
        newcontext = context
        
        if @context then
            newcontext = @context
        end
    
        if @arguments
            newcontext = AjLisp::Context.new newcontext
            values = args
            names = @arguments
            
            args.each do |arg|
                name = names.first.name
                newcontext.setValue name, arg
                names = names.rest
            end
        end
        
        result = nil

        @body.each do |form|
            result = form.evaluate newcontext
        end
        
        return result
    end
end

end

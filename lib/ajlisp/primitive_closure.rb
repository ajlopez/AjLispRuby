
module AjLisp

class PrimiviteClosure < Primitive
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
        body = @body
        
        while body
            result = body.first.evaluate newcontext
            body = body.rest
        end
        
        return result
    end
end

end
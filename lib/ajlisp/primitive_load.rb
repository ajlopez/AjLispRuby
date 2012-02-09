
module AjLisp

  class PrimitiveLoad < Primitive	
    private_class_method :new
      
    @@instance = nil
      
    def self.instance
      @@instance = new unless @@instance
      return @@instance
    end

  	def apply(context, args)       
      result = nil
      
      args.each do |filename|
        source = FileSource.new filename # File.expand_path(filename, File.dirname(__FILE__))
        lexer = Lexer.new source
        parser = Parser.new lexer
        expr = parser.parseExpression
        
        
        while expr
          result = AjLisp::evaluate AjLisp::context, expr
          expr = parser.parseExpression
        end
      end
        
      return result
  	end
  end

end


module AjLisp

class NilAtom < NamedAtom
    private_class_method :new
    
    @@instance = nil

    def self.instance
        @@instance = new unless @@instance
        return @@instance
    end
    
    def initialize()
        super(:nil)
    end
    
    def evaluate(context)
        return nil
    end
	
	def to_s
		return "nil"
	end

    def isEqualTo(atom)
        if atom.is_a? NilAtom
            return true
        end
        
        if atom == nil
            return true
        end
        
        return false
    end
end

end
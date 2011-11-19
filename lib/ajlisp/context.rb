
module AjLisp

class Context
	def initialize(parent = nil)
		@parent = parent
		@values = Hash.new
	end
	
	def getValue(name)
		if @values.has_key?(name)
			return @values[name]
		end
		
		if @parent != nil
			return @parent.getValue(name)
		end
		
		return nil
	end
	
	def setValue(name, value)
		@values[name] = value
	end
end

end
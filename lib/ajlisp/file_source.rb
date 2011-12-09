
module AjLisp

class FileSource < StringSource
	def initialize(filename)
        super(IO.read(filename))
	end
end

end
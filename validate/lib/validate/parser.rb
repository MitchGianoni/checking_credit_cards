module Validate
	class FileParseError < StandardError
		def initialize(msg='Please make sure txt file exists and is
			in the format described in the read me')	
			super	
		end
	end

	class Parser


	end
end
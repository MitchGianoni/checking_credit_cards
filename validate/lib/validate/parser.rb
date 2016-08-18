module Validate
	class FileParseError < StandardError
		def initialize(msg='Please make sure txt file exists')	
			super	
		end
	end

	class Parser
		def parse_txt(file_path)
			lines = File.readlines(file_path).map(&:strip)
		end
	end
end
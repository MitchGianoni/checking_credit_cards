module Validate
	class Director
		def self.combinations_from_txt(file_path)
			card_data = Parser.new.parse_txt(file_path)
		end
	end
end
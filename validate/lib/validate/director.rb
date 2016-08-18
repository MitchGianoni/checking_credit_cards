module Validate
	class Director
		def self.numbers_from_txt(file_path)
			card_data = Parser.new.parse_txt(file_path)
			CardValidator.new(card_data).first_combination
		end
	end
end
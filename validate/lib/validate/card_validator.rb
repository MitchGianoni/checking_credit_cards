module Validate
	class CardValidator
		def self.validate(number)
			validaotr = new(number)

			"Card Type: #{validaotr.type} - Card Number: #{number} - Valid?: #{validaotr.valid?}"
		end

		def initialize(card_data)
			 @account = card_data.to_s
		end

		def type
			case
			when @account[0] == "4" && [13,16].include?(@account.length)
				"Visa"
			when ["51","52","53","54","55"].include?(@account[0,2]) && @account.length == 16 
				"Mastercard" 
			when ["34","37"].include?(@account[0,2]) && @account.length == 15 
				"Amex" 
			when @account[0,4] == "6011" && @account.length == 16 
				"Discover"
			else 
				"Unknown"	
			end
		end

		def valid?
		
			digits = @account.to_s.reverse.chars.map(&:to_i)
 			check_sum = 0

			digits.each_with_index do |digit, index|
				if index.even?
    		      check_sum += digit
    		      next
    		    end
    		  
    		  digit *= 2
    		  digit = digit.divmod(10).inject(:+) if digit > 9
    		  check_sum += digit
			end

			check_sum % 10 == 0
		end
	end
end
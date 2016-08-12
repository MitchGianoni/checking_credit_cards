require 'pry'

array = ["4111111111111111","4111111111111","4012888888881881","378282246310005",
	"6011111111111117","5105105105105100","5105 1051 0510 5106","9111111111111111"]

def type?(account)

	if account[0] == "4"
		account.length == 13 || account.length == 16 ? type = "Visa" : type = "Invalid"
	elsif ["51","52","53","54","55"].include?(account[0,2])
		account.length == 16 ? type = "Mastercard" : tyoe = "Invalid"
	elsif ["34","37"].include?(account[0,2])
		account.length == 15 ? type = "Amex" : type = "Invalid"
	elsif account[0,4] == "6011"
		account.length == 16 ? type = "Discover" : type = "Invalid"
	else type = "Unknown"
	
	end

	type

	binding.pry
end


def valid?(account)
	digits = account.to_s.reverse.chars.map(&:to_i)
 	check_sum = 0
	
	digits.each_slice(2) do |odd, even|
    	check_sum += odd
    	next unless even
    	even *= 2
    	even = even.divmod(10).inject(:+) if even > 9
    	check_sum += even
  end

  return check_sum.modulo(10) == 0

end

array.each do |card|

end

brands = ["#{type?(array[0])},#{type?(array[1])},#{type?(array[2])},#{type?(array[3])},#{type?(array[4])},#{type?(array[5])},#{type?(array[6])},#{type?(array[7])}"]

cards = ["#{valid?(array[0])},#{valid?(array[1])},#{valid?(array[2])},#{valid?(array[3])},#{valid?(array[4])},#{valid?(array[5])},#{valid?(array[6])},#{valid?(array[7])}"]

#binding.pry

puts cards
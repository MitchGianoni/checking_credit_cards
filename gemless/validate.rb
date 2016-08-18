require 'pry'

array = ["4111111111111111","4111111111111","4012888888881881","378282246310005",
	"6011111111111117","5105105105105100","5105 1051 0510 5106","9111111111111111"]

def type?(account)
	case
	when account[0] == "4" && [13,16].include?(account.length)
		"Visa"
	when ["51","52","53","54","55"].include?(account[0,2]) && account.length == 16 
		"Mastercard" 
	when ["34","37"].include?(account[0,2]) && account.length == 15 
		"Amex" 
	when account[0,4] == "6011" && account.length == 16 
		"Discover"
	else 
		"Unknown"	
	end
end

# split it into two methods
# break it down so its easy to read
# assign the type to visa if it starts with 4, then scan for proper card format
# make it as simple as possible to read
# wrote the code once, now we are both reading it, spend more time reading code than writing code

# how do i write this such that it is easily readable
# how do i express a requirement in code so that it is immediately obvious including naming
# general readability

def valid?(account)
	digits = account.to_s.reverse.chars.map(&:to_i)
	# digits = account.to_s.reverse.chars.map { |c| c.to_i }
 	check_sum = 0

	doubled_digits = digits.with_index { |num, index| index.odd? ? num * 2 : num }

	digits.each_slice(2) do |odd, even|
    	check_sum += odd
    	next unless even
    	even *= 2
    	even = even.divmod(10).inject(:+) if even > 9
    	check_sum += even
  end

  # look to refactor
  check_sum % 10 == 0
  check_sum.modulo(10) == 0

end

array.each do |card|
  # Validator.validate(card) # => Amex, valid / Visa, invalid
end

brands = ["#{type?(array[0])},#{type?(array[1])},#{type?(array[2])},#{type?(array[3])},#{type?(array[4])},#{type?(array[5])},#{type?(array[6])},#{type?(array[7])}"]

cards = ["#{valid?(array[0])},#{valid?(array[1])},#{valid?(array[2])},#{valid?(array[3])},#{valid?(array[4])},#{valid?(array[5])},#{valid?(array[6])},#{valid?(array[7])}"]

#binding.pry

puts cards
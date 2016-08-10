require 'pry'

array = ["4111111111111111","4111111111111","4012888888881881","378282246310005",
	"6011111111111117","5105105105105100","5105 1051 0510 5106","9111111111111111"]

def valid?(account)
  digits = account.chars.map(&:to_i)
  check = digits.pop

  sum = digits.reverse.each_slice(2).flat_map do |x, y|
    [(x * 2).divmod(10), y || 0]
  end.flatten.inject(:+)

  (10 - sum % 10) == check


end

cards = ["#{valid?(array[0])},#{valid?(array[1])},#{valid?(array[2])},#{valid?(array[3])},#{valid?(array[4])},#{valid?(array[5])},#{valid?(array[6])},#{valid?(array[7])}"]

#binding.pry

puts cards
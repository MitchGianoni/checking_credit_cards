require 'pry'

array = ["4111111111111111","4111111111111","4012888888881881","378282246310005",
	"6011111111111117","5105105105105100","5105 1051 0510 5106","9111111111111111"]

def credit_card_valid?(account_number)
  digits = account_number.chars.map(&:to_i)
  check = digits.pop

  sum = digits.reverse.each_slice(2).flat_map do |x, y|
    [(x * 2).divmod(10), y || 0]
  end.flatten.inject(:+)

  (10 - sum % 10) == check


end

validity1 = credit_card_valid?(array[0])
validity2 = credit_card_valid?(array[1])
validity3 = credit_card_valid?(array[2])
validity4 = credit_card_valid?(array[3])

validity5 = credit_card_valid?(array[4])
validity6 = credit_card_valid?(array[5])
validity7 = credit_card_valid?(array[6])
validity8 = credit_card_valid?(array[7])

cards = "#{validity1}, #{validity2}, #{validity3}, #{validity4}, #{validity5}, #{validity6}, #{validity7}, #{validity8}"

binding.pry

puts cards
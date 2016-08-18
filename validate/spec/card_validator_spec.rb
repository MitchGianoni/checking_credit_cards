require 'spec_helper'

describe Validate::CardValidator do
	context '.validate' do
		it 'prints out card information' do
			expect(Validate::CardValidator.validate(4111111111111111)).to eq("Card Type: Visa - Card Number: 4111111111111111 - Valid?: true")
		end
	end


	context '#type' do
	it 'validates Visa' do
	  result = Validate::CardValidator.new(4111111111111111).type
 
	  expect(result).to eq('Visa')
	end

	it 'validates Mastercard' do
		result = Validate::CardValidator.new(5111111111111111).type

		expect(result).to eq('Mastercard')
	end

	it 'validates Amex' do

	end

	it 'validates Discover' do

	end

	it 'returns Unknown' do
		result = Validate::CardValidator.new("numbers").type

		expect(result).to eq('Unknown')
	end
end

	context '#valid?' do
		it 'returns true if card is valid' do
			result = Validate::CardValidator.new(4111111111111111).valid?

			expect(result).to eq(true)
		end

		it 'returns true if card is valid' do
			result = Validate::CardValidator.new(5105105105105100).valid?

			expect(result).to eq(true)
		end

		it 'returns false if card is invalid' do
			result = Validate::CardValidator.new(29849823904829).valid?
			expect(result).to eq(false)
		end
	end
end
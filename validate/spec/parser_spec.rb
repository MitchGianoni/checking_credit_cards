require 'spec_helper'

describe Validate::Parser do
	describe '#parse' do
		let(:parser) { described_class.new }
		let(:file_path) { 'spec/fixtures/cards.txt' }

		context 'when first line is a card number and folloing lines are
			 card numbers' do
			it 'returns an Array containing all the card numbers' do
				parsed_data = parser.parse_txt(file_path)
				expect(parsed_data.class).to eq("Array")
		end
	end

end
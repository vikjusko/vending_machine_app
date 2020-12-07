# frozen_string_literal: true

require 'coin'
describe Coin do
  let(:coin) { described_class.new(20) }

  it 'is initilized by value and quantity' do
    expect(coin.value).to eq 20
  end
  describe '#valid?' do
    it 'confirms if a coin is valid' do
      expect(coin).to be_valid
    end

    it 'throws an error if the coin is not valid' do
      coin2 = Coin.new(0.15)
      expect { coin2.valid? }.to raise_error 'Invalid coin'
    end
	end
	
	describe "#insert_amount" do
		it "updates the coin quanity" do 
			coin.insert(20)
			expect(coin.quantity).to eq 50
		end
	end

	describe "#refund(amount)" do 
		it "refunds the amount of coins and updates the quantity" do
			coin.refund(amount(3))
			expect(coin.quantity).to eq 27
		end
	end
end

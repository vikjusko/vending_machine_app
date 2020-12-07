# frozen_string_literal: true

require 'transaction'
describe Transaction do
  before(:each) do
    allow($stdout).to receive(:puts)
  end

  let(:purchase) { described_class.new }
  describe '#initialize' do
    it 'is initialized with a list of Items that belong to an item class' do
      expect(purchase.items.list).to be_an Array
    end

    it 'is initialized by a change that is also an array' do
      expect(purchase.change).to be_an_instance_of(Change)
    end
  end

  describe '#place an order' do
    it "lets someone place an order once they've chosen an item" do
      expect(purchase.place_order(1)).to eq('Please, start again and insert more money next time ☺️')
    end
    it "let's a client know if the chosen item does not exist" do
      purchase.place_order(12)
      expect(purchase.place_order(12)).to eq("Sorry, we don't sell this item 😳! Let's try again")
    end

    it "let's a clinet know if the chosen item is out of stock" do
      expect(purchase.place_order(5)).to eq('We are so sorry, this item is sold out!😩')
    end
  end

  describe '#add_funds' do
    it 'can add coins to funds' do
      purchase.add_funds([50, 50, 50])
      expect(purchase.funds).to eq [50, 50, 50]
		end
		
		it "can add coins to funds" do
  		purchase.add_funds([20])
  		expect(purchase.funds).to eq [20]
		end
  end
end

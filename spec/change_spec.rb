# frozen_string_literal: true

require 'change'
describe Change do
  let(:change) { described_class.new }

  it 'is initialized by coin supply that is an array' do
    expect(change.coins).to be_an Array
  end

  it 'coins belong to a class of coin' do
    expect(change.coins[0]).to be_an_instance_of(Coin)
  end

  describe '#issue_coin' do
    it 'can update the quantity of a certain coin in the machine after giving a coin refund' do
      expect(change.issue_coin(50, 1)).to eq 29
    end
  end

  describe '#accept_coin' do
    it 'can update the quantity of a certain coin in the machine after accepting coins' do
      expect(change.accept_coin(100, 5)).to eq 35
    end
  end
end

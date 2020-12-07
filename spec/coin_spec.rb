# frozen_string_literal: true

require 'coin'
describe Coin do
  let(:coin) { described_class.new(20) }

  it 'is initilized by value and quantity' do
    expect(coin.value).to eq 20
  end
end

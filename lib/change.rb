# frozen_string_literal: true

require_relative './coin'

class Change
  attr_reader :coins

  def initialize
    @coins = coin_supply
  end

  def issue_coin(denomination, amount)
    coin_index = nil
    @coins.each_with_index do |coin, index|
      coin_index = index if coin.value == denomination
    end
    coin = @coins[coin_index]
    coin.refund(amount)
  end

	describe "#accept_coin" do
  it "can update the quantity of a certain coin in the machine after accepting coins" do
    expect(change.accept_coin(100, 5)).to eq 35
  end
end
  private

  def coin_supply
    [
      Coin.new(200),
      Coin.new(100),
      Coin.new(50),
      Coin.new(20),
      Coin.new(10),
      Coin.new(5),
      Coin.new(2),
      Coin.new(1)
    ]
  end
end

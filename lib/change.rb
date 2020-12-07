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

  def accept_coin(denomination, amount)
    coin_index = nil
    @coins.each_with_index do |coin, index|
      coin_index = index if coin.value == denomination
    end
    coin = @coins[coin_index]
    coin.insert(amount)
  end

  def issue_change(coins, price)
    raise 'Not enough money, sorry' if (sum(coins) - price).negative?

    change_due = sum(coins) - price
    change = change_due
    twopounds, change = change.divmod(200)
    onepounds, change = change.divmod(100)
    fifties, change = change.divmod(50)
    twenties, change = change.divmod(20)
    tens, change = change.divmod(10)
    fives, change = change.divmod(5)
    twos, change = change.divmod(2)
    ones, change = change.divmod(1)
    change_array = twopounds, onepounds, fifties, twenties, tens, fives, twos, ones
    format_change(change_array)
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

  def sum(coins)
    coins.reduce(:+)
  end

  def format_change(change)
    new_array = []
    new_array << ['£2'] * change[0]
    new_array << ['£1'] * change[1]
    new_array << ['50p'] * change[2]
    new_array << ['20p'] * change[3]
    new_array << ['10p'] * change[4]
    new_array << ['5p'] * change[5]
    new_array << ['2p'] * change[6]
    new_array << ['1p'] * change[7]
    new_array.delete_if { |elem| elem.flatten.empty? }
    new_array.join(', ')
  end
end

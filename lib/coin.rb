# frozen_string_literal: true

class Coin
  attr_reader :value, :quantity

  VALID_COINS = [200, 100, 50, 20, 10, 5, 2, 1].freeze

  def initialize(value, quantity = 30)
    @value = value
    @quantity = quantity
  end

  def valid?
    raise 'Invalid coin' unless VALID_COINS.include?(@value)

    VALID_COINS.include?(@value)
  end

  def insert(amount)
    @quantity += amount
  end

  def refund(amount)
    @quantity -= amount
  end
end

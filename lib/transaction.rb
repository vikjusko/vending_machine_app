# frozen_string_literal: true

require_relative './items'
require_relative './change'
require_relative './interface'

class Transaction
  attr_reader :items, :change, :interface, :funds, :complete

  VALID_COINS = [200, 100, 50, 20, 10, 5, 2, 1].freeze

  def initialize(items = Items.new, change = Change.new, interface = Interface.new)
    @items = items
    @selection = nil
    @change = change
    @interface = interface
    @funds = []
    @complete = false
  end

  def place_order(selection)
    @selection = selection.to_i
    @selection
    if invalid_selection
      @interface.invalid_selection
    else
      item = @items.list.find { |item| item.code == @selection }
      quantity = item.quantity
      return @interface.sold_out if quantity <= 0

      price = item.price
      if require_coins?(price)
        @interface.payment_due
      else
        accept_coins(price)
        issue_with_change
      end
    end
  end

  def enough_money
    item = @items.list.find { |item| item.code == @selection }
    item.price <= total_funds
  end

  def add_funds(coins)
    coins.each { |coin| return 'Please only use valid coins' unless VALID_COINS.include?(coin) }
    @funds << coins
    @funds.flatten!
  end

  def accept_coins(price)
    @funds.each { |coin| @change.accept_coin(coin, 1) }
    @change_due = @change.issue_change(@funds, price) unless require_coins?(price)
  end

  def issue_with_change
    issue_order_item
    issue_change
  end

  def issue_order_item
    item = @items.list.find { |item| item.code == @selection }
    @complete = true
    # item.sell
    @interface.take_your_item(item)
  end

  def issue_change
    if @change_due.to_s.strip.empty?
      @interface.no_change_due
    else
      change = @change_due
      @interface.take_your_change(change)
    end
  end

  private

  def invalid_selection
    @items.list.find { |item| item.code == @selection }.nil?
  end

  def total_funds
    @funds.reduce(0) { |sum, amount| sum + amount }
  end

  def require_coins?(price)
    total_funds < price
  end
end

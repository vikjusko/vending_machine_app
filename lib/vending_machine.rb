# frozen_string_literal: true

require_relative './items'
require_relative './change'
require_relative './interface'
require_relative './transaction'

class VendingMachine
  VALID_COINS = [200, 100, 50, 20, 10, 5, 2, 1].freeze

  attr_reader :items, :change, :profit, :interface, :selection, :transaction, :history

  def initialize(itemsClass = Items, changeClass = Change, interfaceClass = Interface)
    @selection = nil
    @items = itemsClass.new
    @change = changeClass.new
    @interface = interfaceClass.new
    @transaction = Transaction.new
    @history = []
  end

  def start
    loop do
      start_instructions
      add_coin(gets.chomp)
      @interface.confirmation_status
      while gets.chomp != 'yes'
        requesting_money
      end
      @interface.put_in_code
      @transaction.place_order(@selection = gets.chomp)
      @history << @selection
      sell_item if @transaction.complete
      @interface.finish
      break if finish?
    end
  end

  def restock_item(item_name, amount)
    item = @items.list.find { |item| item.name == item_name }
    item.restock(amount)
  end

  def reload_change(denomination, amount)
    coin_index = nil
    @change.coins.each_with_index do |coin, index|
      coin_index = index if coin.value == denomination
    end
    coin = @change.coins[coin_index]
    coin.insert(amount)
  end


    def most_popular_items
      a = @history.inject(Hash.new(0)) { |h, e| h[e] += 1; h }
      a.sort_by { |k, v| v }.reverse
      return a.keys[1..3]
    end 

  private

  def add_coin(coin)
    if VALID_COINS.include?(coin.to_i)
      @transaction.add_funds([coin.to_i])
    else
      @interface.invalid_coin
    end
  end

  def sell_item
    item = @items.list.find { |item| item.code == @selection.to_i }
    item.sell
  end

  def start_instructions
    @interface.welcome
    @interface.item_list(@items)
    @interface.instructions
    @interface.request_payment
  end

  def requesting_money
    @interface.request_payment
    add_coin(gets.chomp)
    @interface.confirmation_status
  end 

  def complete_purchase
    @interface.put_in_code
    @transaction.place_order(@selection = gets.chomp)
    @history << @selection
    sell_item if @transaction.complete
  end 

  def finish?
    gets.chomp == "exit"
  end


end

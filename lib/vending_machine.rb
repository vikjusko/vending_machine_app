# frozen_string_literal: true

require_relative "./items"
require_relative "./change"
require_relative "./interface"
require_relative "./transaction"

class VendingMachine

VALID_COINS = [200, 100, 50, 20, 10, 5, 2, 1]

  attr_reader :items, :change, :profit, :interface, :selection, :transaction

  def initialize(itemsClass = Items, changeClass = Change, interfaceClass = Interface)
    @selection = nil
    @items = itemsClass.new
    @change = changeClass.new
    @interface = interfaceClass.new
    @transaction = Transaction.new
  end

  def start
    @interface.welcome
    @interface.item_list(@items)
    @interface.instructions
    @interface.request_payment
		p add_coin(gets.chomp)
    @interface.confirmation_status
    while gets.chomp != "yes" 
			@interface.request_payment
				add_coin(gets.chomp)
      @interface.confirmation_status
    end
    @interface.put_in_code
    @transaction.place_order(@selection = gets.chomp)
	end
	
	def restock_item(item_name, amount)
		item = @items.list.find { |item| item.name == item_name}
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


  private

	def add_coin(coin)
		if VALID_COINS.include?(coin.to_i) 
			@transaction.add_funds([coin.to_i])
		else 
			return	"Please only used valid coins"
		end
  end
end




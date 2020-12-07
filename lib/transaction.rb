
require_relative './items'
require_relative './change'
require_relative './interface'

class Transaction
  attr_reader :items, :change, :interface, :funds

  VALID_COINS = [200, 100, 50, 20, 10, 5, 2, 1].freeze

  def initialize(items = Items.new, change = Change.new, interface = Interface.new)
    @items = items
    @selection = nil
    @change = change
    @interface = interface
    @funds = []
	end
end
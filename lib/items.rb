# frozen_string_literal: true

require_relative './item'

class Items
  attr_reader :list

  ITEMS = [Item.new(1, 'Coca-Cola', 85, 10),
           Item.new(2, 'Fanta', 100, 12),
           Item.new(3, 'Diet-Coke', 150, 8),
           Item.new(4, 'Dr. Pepper', 100, 9),
           Item.new(5, 'Evian', 100, 0),
           Item.new(6, 'Maltesers', 200, 4),
           Item.new(7, 'Skittles', 85, 1)].freeze

  def initialize(list = ITEMS)
    @list = list
  end
end

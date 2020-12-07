# frozen_string_literal: true

class Item
  attr_reader :code, :name, :quantity, :price

  def initialize(code, name, price, quantity)
    @code = code
    @name = name
    @price = price
    @quantity = quantity
  end

  def sell
    @quantity -= 1
	end
	
	def restock(amount)
  	@quantity += amount
	end
end

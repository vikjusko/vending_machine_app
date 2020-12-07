class Interface
	  def welcome
    p "Hey there, someone's hungry?!🍫🍿🙈\nGo on then, make your choice!"
	end
	
	  def instructions
    p "To buy a snack, please insert some coins and then confirm the the item code!🪙🪙🪙"
	end
	

	  def item_list(items)
    puts'Take a look at our selection: '
    items.list.each do |item|
      if item.quantity.positive?
        return "Code: 0#{item.code}, name: #{item.name}, price: #{item.price} quantity: #{item.quantity}."
      else
        return "#{item.name} is SOLD out, sorry!😣"
      end
    end
  end
end 
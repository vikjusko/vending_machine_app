# frozen_string_literal: true

class Interface
  def welcome
    p "Hey there, someone's hungry?!🍫🍿🙈\nGo on then, make your choice!"
  end

  def instructions
    p "To buy a snack, please insert some coins and then confirm the the item code!\u{1FA99}\u{1FA99}\u{1FA99}"
  end

  def item_list(items)
    puts 'Take a look at our selection: '
    items.list.each do |item|
      if item.quantity.positive?
        return "Code: 0#{item.code}, name: #{item.name}, price: #{item.price} quantity: #{item.quantity}."
      else
        return "#{item.name} is SOLD out, sorry!😣"
      end
    end
  end

  def put_in_code
    p 'Please select the snack code'
  end

  def request_payment
    p 'Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!'
  end
end

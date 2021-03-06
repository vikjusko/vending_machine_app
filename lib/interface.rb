# frozen_string_literal: true

class Interface
  def welcome
    p "Hey there, someone's hungry?!🍫🍿🙈\nGo on then, make your choice!"
  end

  def instructions
    p 'To buy a snack, please insert some coins and then confirm the item code!'
  end

  def item_list(items)
    puts 'Take a look at our selection: '
    items.list.each do |item|
      if item.quantity.positive?
        puts "Code: 0#{item.code}, name: #{item.name}, price: #{item.price} quantity: #{item.quantity}."
      else
        puts "Code: 0#{item.code}. #{item.name} is SOLD out, sorry!😣"
      end
    end
  end

  def put_in_code
    p 'Please select the snack code'
  end

  def sold_out
    p 'We are so sorry, this item is sold out!😩'
  end

  def request_payment
    p 'Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!'
  end

  def payment_due
    p 'Please, start again and insert more money next time ☺️'
  end

  def invalid_selection
    p "Sorry, we don't sell this item 😳! Let's try again"
  end

  def confirmation_status
    p 'Please select yes if you have put in enough money, no to continue inserting coins'
  end

  def take_your_item(item)
    p "Please collect your #{item.name}"
  end

  def take_your_change(change)
    p "Please, don't forget your change: #{change}!"
  end

  def no_change_due
    p "We don't owe you any change,BYE!😉"
  end

  def invalid_coin
    p 'Please only insert valid coins!'
  end

  def finish
    p "Please select exit if you have enough snacks"
  end 
end

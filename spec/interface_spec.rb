# frozen_string_literal: true

require 'interface'
describe Interface do
  before(:each) do
    allow($stdout).to receive(:puts)
  end

  describe '#welcome message of the interface' do
    it 'prints a welcome message when its cllased' do
      expect(subject.welcome).to eq("Hey there, someone's hungry?!🍫🍿🙈\nGo on then, make your choice!")
    end
  end

  describe '#instruction message' do
    it 'prints out the instruction message' do
      expect(subject.instructions).to eq('To buy a snack, please insert some coins and then confirm the the item code!')
    end
  end

  describe '#item_list' do
    it 'prints out an item list' do
      item = double('item', code: 1, name: 'Coca-Cola', price: 100, quantity: 10)
      items = double('items', list: [item])
      expect(subject.item_list(items)).to eq 'Code: 01, name: Coca-Cola, price: 100 quantity: 10.'
    end

    it 'prints out a sold out message if the item is not in stock' do
      item = instance_double('item', code: 1, name: 'Coca-Cola', price: 100, quantity: 0)
      items = instance_double('items', list: [item])
      expect(subject.item_list(items)).to eq('Coca-Cola is SOLD out, sorry!😣')
    end
  end

  describe '#request payment' do
    it 'requests for a payment in a correct format' do
      expect(subject.request_payment).to eq('Please insert coins, we take 1p, 2p, 5p, 10p, 20p, 50p, 100p and 200p!')
    end
  end

  describe '#put_in code' do
    it 'promts a user to select the item code' do
      expect(subject.put_in_code).to eq('Please select the snack code')
    end
  end

  describe '#take_your item' do
    it 'notifies a user that their item is ready for collection' do
      item = double('item', code: 0o2, name: 'Fanta', price: 2.00, quantity: 12)
      expect(subject.take_your_item(item)).to eq('Please collect your Fanta')
    end
  end

  describe '#take_your_change' do
    it 'notifies a user that their change is ready to be collected' do
      expect(subject.take_your_change('20p')).to eq "Please, don't forget your change: 20p!"
    end
  end

  describe '#no_change_due' do
    it 'notifies that the user is due no change' do
      expect(subject.no_change_due).to eq "We don't owe you any change,BYE!😉"
    end
  end

  describe '#confirmation_status' do
    it 'asks a customer to either confrim finishing insertin coins or continue' do
      expect(subject.confirmation_status).to eq 'Please select yes if you have put it enough money, no to continue inserting coins'
    end
  end

  describe '#sold_out message' do
    it 'prints out sold_out message' do
      expect(subject.sold_out).to eq('We are so sorry, this item is sold out!😩')
    end
  end
  describe '#payment_due' do
    it 'promts the user to start again' do
      expect(subject.payment_due).to eq 'Please, start again and insert more money next time ☺️'
    end
  end

  describe '#invalid_selection' do
    it 'lets the user know that such selection does not exist' do
      expect(subject.invalid_selection).to eq "Sorry, we don't sell this item 😳! Let's try again"
    end
  end
end

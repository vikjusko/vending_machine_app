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
      expect(subject.instructions).to eq("To buy a snack, please insert some coins and then confirm the the item code!\u{1FA99}\u{1FA99}\u{1FA99}")
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
end

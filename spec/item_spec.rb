# frozen_string_literal: true

require 'item'
describe Item do
  let(:item) { described_class.new(code, name, price, quantity) }
  let(:code) { 1 }
  let(:name) { 'Coca Cola' }
  let(:price) { 1.00 }
  let(:quantity) { 8 }

  it 'is initialized by name and price' do
    expect(item.code).to eq 1
    expect(item.name).to eq name
    expect(item.price).to eq price
    expect(item.quantity).to eq quantity
  end

  it 'can be sold and the quantity of the product will be updated' do
    expect { item.sell }.to change { item.quantity }.by(-1)
  end

  it 'can be re_stocked and the quantity of the item will increase by a correct amount' do
    expect { item.restock(20) }.to change { item.quantity }.by(20)
  end
end

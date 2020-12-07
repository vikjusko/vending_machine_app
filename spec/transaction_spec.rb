# frozen_string_literal: true

require 'transaction'
describe Transaction do
  before(:each) do
    allow($stdout).to receive(:puts)
  end

  let(:purchase) { described_class.new }
  describe '#initialize' do
    it 'is initialized with a list of Items that belong to an item class' do
      expect(purchase.items.list).to be_an Array
    end

	    it 'is initialized by a change that is also an array' do
      expect(purchase.change).to be_an_instance_of(Change)
    end
  end
end

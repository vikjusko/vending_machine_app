require "transaction"
describe Transaction do 
	before(:each) do
  allow($stdout).to receive(:puts)
end

  let(:purchase) { described_class.new }
  describe '#initialize' do
    it 'is initialized with a list of Items that belong to an item class' do
      expect(purchase.items.list).to be_an Array
    end
	end
end 
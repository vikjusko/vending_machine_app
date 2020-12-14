require "vending_machine"

describe VendingMachine do
let(:machine) { described_class.new }

describe "#history" do 
it "vending machine is initialized by history that is an empty array" do 
	expect(machine.history).to be_an Array
end 
end 

end 
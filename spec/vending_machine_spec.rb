require "vending_machine"

describe VendingMachine do
let(:machine) { described_class.new }

describe "#history" do 
it "vending machine is initialized by history that is an empty array" do 
	expect(machine.history).to be_an Array
end 
end 

it "stores all of the selected items in history array" do 
	
	machine.transaction.place_order("3")
	machine.transaction.place_order("4")
	expect(machine.history).to eq ["3", "4"]
end 

end 
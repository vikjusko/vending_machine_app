require "interface"
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
      expect(subject.instructions).to eq("To buy a snack, please insert some coins and then confirm the the item code!🪙🪙🪙")
    end
  end
end

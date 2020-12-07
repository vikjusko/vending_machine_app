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
      expect(subject.instructions).to eq("To buy a snack, please enter it's code and insert correct amount of coins!🪙🪙🪙")
    end
  end
end

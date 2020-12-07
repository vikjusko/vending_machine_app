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

end

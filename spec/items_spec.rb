# frozen_string_literal: true

require 'items'

describe Items do
  it 'is initialized by a list of of items' do
    expect(subject.list).to eq Items::ITEMS
	end
	
	it "items belong to a class of item" do
  expect(subject.list[0]).to be_an_instance_of(Item)
end
end

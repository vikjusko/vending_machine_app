# frozen_string_literal: true

require 'items'

describe Items do
  it 'is initialized by a list of of items' do
    expect(subject.list).to eq Items::ITEMS
  end
end

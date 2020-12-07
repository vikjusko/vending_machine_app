# frozen_string_literal: true

require 'change'
describe Change do
  let(:change) { described_class.new }

  it 'is initialized by coin supply that is an array' do
    expect(change.coins).to be_an Array
  end
end

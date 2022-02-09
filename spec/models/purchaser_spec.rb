require 'rails_helper'

describe Purchaser, type: :model do
  it 'Valid with a name' do
    purchaser = Purchaser.new(name: 'Geralt of Rivia')
    expect(purchaser).to be_valid
  end
  it 'Not valid without a name' do
    purchaser = Purchaser.new
    expect(purchaser).to be_invalid
  end
end

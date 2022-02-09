require 'rails_helper'

RSpec.describe Merchant, type: :model do
  it 'Valid with address and name' do
    merchant = Merchant.new(address: 'Cool Street 1', name: 'Kublain Khan')
    expect(merchant).to be_valid
  end
  it 'Not valid missing name and address' do
    merchant = Merchant.new
    expect(merchant).to be_invalid
  end
end

require 'rails_helper'

describe Item, type: :model do
  it 'Valid with price, description and merchant_id' do
    merchant = Merchant.new(address: 'Cool Street 1', name: 'James Bond')
    merchant.save
    item = Item.new(description: 'Very cool Product', price: 10.4)
    item.merchant = merchant
    expect(item).to be_valid
  end
  it 'Not valid, item is missing attributes' do
    item = Item.new
    expect(item).to be_invalid
  end
end

require 'rails_helper'

describe Cart, type: :model do
  it 'Valid cart with count, sale_id, purchaser_id and item_id' do
    cart = Cart.new(count: 1)
    purchaser = Purchaser.new(name: 'John')
    purchaser.save
    item = Item.new(description: 'Cool Item', price: 10.2)
    item.save
    sale = Sale.new
    sale.save
    cart.sale = sale
    cart.purchaser = purchaser
    cart.item = item
    expect(cart).to be_valid
  end
  it 'Cart not valid, missing attributes' do
    cart = Cart.new
    expect(cart).to be_invalid
  end
end

class CartsController < ApplicationController
  def index
    @carts = Cart.all
  end

  def import
    myfile = params[:file]
    if myfile.blank?
      flash.alert = 'Please select file.'
      return
    end
    @tsv_file = TSV[myfile.path].map { |row| row }
    @tsv_file.each do |row|
      array = row.data
      @cart = Cart.new
      @cart.count = array[3]
      check_merchant(array[5], array[4])
      check_purchaser(array[0])
      check_item(array[1], array[2])
      @cart.purchaser = @purchaser
      @cart.item = @item
      @cart.save!
    end
    redirect_to root_path
  end

  def check_purchaser(name)
    if name == Purchaser.where(name: name)
      @purchaser = Purchaser.where(name: name)
    else
      @purchaser = Purchaser.new
      @purchaser.name = name
      @purchaser.save!
    end
  end

  def check_merchant(name, address)
    if name == Merchant.where(name: name) && Merchant.where(address: address)
      @merchant = Merchant.where(name: name)
    else
      @merchant = Merchant.new
      @merchant.name = name
      @merchant.address = address
      @merchant.save!
    end
  end

  def check_item(description, price)
    if description == Item.where(description: description)
      @item = Item.where(description: description)
    else
      @item = Item.new
      @item.description = description
      @item.price = price
      @item.merchant = @merchant
      @item.save!
    end
  end
end

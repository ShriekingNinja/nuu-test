class CartsController < ApplicationController
  # Assigns all carts and sales
  def index
    @carts = Cart.all
    @sales = Sale.all
  end

  # Import method to parse the TSV
  def import
    # Assign the uploaded file to a variable
    myfile = params[:file]
    # Checks if the file is empty, if true returns and gives a notice
    if myfile.blank?
      flash.alert = 'Please select file.'
      return
    end
    # Start a new sale
    @sale = Sale.new
    @sale.save!
    # Parse the TSV file to get the data
    @tsv_file = TSV[myfile.path].map { |row| row }
    # Prepare to extract each row of the data
    @tsv_file.each do |row|
      # Assigns each data to an array
      array = row.data
      # Start a new cart
      @cart = Cart.new
      # Assign Count to Cart
      @cart.count = array[3]
      # Check if Merchant is already in the DB
      check_merchant(array[5], array[4])
      # Check if Purchaser is already in the DB
      check_purchaser(array[0])
      # Check if Item is already in the DB
      check_item(array[1], array[2])
      # Assign Purchaser to Cart
      @cart.purchaser = @purchaser
      # Assign Sale to Cart
      @cart.sale = @sale
      # Assign Item to Cart
      @cart.item = @item
      # Save the Cart in the DB
      @cart.save!
    end
    # Redirect to the index page
    redirect_to root_path
  end

  # Check if the Purchaser is already in the DB
  def check_purchaser(name)
    # If Purchase found return it, else creates a new purchaser
    if name == Purchaser.where(name: name)
      @purchaser = Purchaser.where(name: name)
    else
      @purchaser = Purchaser.new
      @purchaser.name = name
      @purchaser.save!
    end
  end

  # Check if the Merchant is already in the DB
  def check_merchant(name, address)
    # If Purchase found return it, else creates a new merchant
    if name == Merchant.where(name: name) && Merchant.where(address: address)
      @merchant = Merchant.where(name: name)
    else
      @merchant = Merchant.new
      @merchant.name = name
      @merchant.address = address
      @merchant.save!
    end
  end

  # Check if the Item is already in the DB
  def check_item(description, price)
    # If Item found return it, else creates a new item
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

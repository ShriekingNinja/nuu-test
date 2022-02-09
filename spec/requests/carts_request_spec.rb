require 'rails_helper'
require 'tsv'


describe "Carts", type: :request do
  describe 'GET /carts' do
    it 'Returns all sales and all carts' do
      get carts_path
      expect(assigns(:carts)).to eq(Cart.all)
      expect(assigns(:sales)).to eq(Sale.all)
    end
  end

  describe "POST carts/import" do
    it 'Expect Uploaded file.data length of 6' do
      @file = TSV[file_fixture('example_input.tab')].map { |row| row }.first.data
      expect(@file.length).to be(6)
    end
  end

  describe "POST carts/import" do
    it 'Expect price and count to be numbers' do
      @file = TSV[file_fixture('example_input.tab')].map { |row| row }.first.data
      count = @file[2].to_i
      price = @file[4].to_f
      expect(count).to be_an(Integer)
      expect(price).to be_an(Float)
    end
  end
end

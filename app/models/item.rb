class Item < ApplicationRecord
  has_many :carts
  belongs_to :merchant
  validates :description, :price, presence: true
end

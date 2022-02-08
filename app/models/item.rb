class Item < ApplicationRecord
  has_many :carts
  belongs_to :merchant
end

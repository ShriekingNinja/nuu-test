class Merchant < ApplicationRecord
  has_many :items
  validates :name, :address, presence: true
end

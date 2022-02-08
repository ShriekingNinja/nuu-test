class Cart < ApplicationRecord
  belongs_to :purchaser
  has_many :items
end

class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser
  belongs_to :sale
  validates :count, presence: true
end

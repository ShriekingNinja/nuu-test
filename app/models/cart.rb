class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser
  belongs_to :sale
end

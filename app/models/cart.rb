class Cart < ApplicationRecord
  belongs_to :item
  belongs_to :purchaser
end

class AddReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :purchasers, :cart, foreign_key: true
    add_reference :carts, :item, foreign_key: true
    add_reference :merchants, :item, foreign_key: true
  end
end

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.references :items,　foreign_key: true
      t.references :carts, foreign_key: true

      t.timestamps
    end
  end
end

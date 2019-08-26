class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      #t.integer :quantity, null: false
      t.cart_item_id :string,
      t.references :item,　foreign_key: true
      t.references :cart_item, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end

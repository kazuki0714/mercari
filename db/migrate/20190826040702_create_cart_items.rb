class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity
      t.references :item,　foreign_key: true, optional:true
      t.references :cart, foreign_key: true, optional:true
      t.timestamps
    end
  end
end

class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :card_type, null: false, limit: 5
      t.integer :card_number, null: false, limit: 16
      t.string :card_name, null: false, limit: 45
      t.integer :cvv, null: false, limit: 3
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end

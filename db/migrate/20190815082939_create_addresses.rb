class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :zipcode
      t.string :address
      t.boolean :same_as_user_address, default: true

      t.timestamps
    end
  end
end

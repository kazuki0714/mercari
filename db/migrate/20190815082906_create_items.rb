class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.string :image, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.string :stock, null: false
      t.string :price, null: false
      t.integer :status, default: 0, null: false, limit: 1
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end

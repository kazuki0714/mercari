class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.datetime :created_at

      t.timestamps
    end
  end
end

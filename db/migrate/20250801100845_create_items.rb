class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.references :brand, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price, null: false
      t.text :description
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2, null: false
      t.text :description
      t.boolean :published, default: false, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

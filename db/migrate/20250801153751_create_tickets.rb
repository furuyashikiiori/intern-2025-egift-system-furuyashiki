class CreateTickets < ActiveRecord::Migration[8.0]
  def change
    create_table :tickets do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :uuid, null: false, index: { unique: true }

      t.timestamps
    end
  end
end

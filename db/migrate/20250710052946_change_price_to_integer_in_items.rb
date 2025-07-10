class ChangePriceToIntegerInItems < ActiveRecord::Migration[8.0]
  def up
    change_column :items, :price, :integer, null: false
  end

  def down
    change_column :items, :price, :decimal, precision: 10, scale: 2, null: false
  end
end

class AddStatusToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :status, :boolean, default: true, null: false
  end
end

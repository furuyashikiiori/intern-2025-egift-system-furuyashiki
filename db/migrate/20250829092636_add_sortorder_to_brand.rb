class AddSortorderToBrand < ActiveRecord::Migration[8.0]
  def change
    add_column :brands, :sortorder, :string, default: 'created_at', null: false
  end
end
  
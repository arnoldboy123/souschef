class AddColumnToFridgeItems < ActiveRecord::Migration[6.0]
  def change
    add_column :fridge_items, :quantity, :integer
  end
end

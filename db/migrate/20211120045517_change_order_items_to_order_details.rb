class ChangeOrderItemsToOrderDetails < ActiveRecord::Migration[5.0]
  def change
    rename_table :order_items, :order_details
  end
end

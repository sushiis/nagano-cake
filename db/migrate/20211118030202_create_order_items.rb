class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
    
      t.integer :amount
      t.integer :making_status
      t.integer :price

      t.timestamps
    end
  end
end

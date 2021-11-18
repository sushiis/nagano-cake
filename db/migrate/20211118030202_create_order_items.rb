class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
    
      t.integer :amount, null: false
      t.integer :making_status, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end
end

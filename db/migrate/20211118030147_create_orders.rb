class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    
      t.integer :postage, null: false
      t.integer :total_price, null: false
      t.integer :way, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end

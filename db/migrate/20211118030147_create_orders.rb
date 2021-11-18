class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
    
      t.integer :postage
      t.integer :total_price
      t.integer :way
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :status

      t.timestamps
    end
  end
end

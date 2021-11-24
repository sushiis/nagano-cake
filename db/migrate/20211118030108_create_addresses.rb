class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      
      t.string :name, null: false
      t.string :address, null: false
      t.string :postal_code, null: false
      t.integer :customer_id
      
      t.timestamps
    end
  end
end

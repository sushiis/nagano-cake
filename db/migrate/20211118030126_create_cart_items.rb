class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      
      t.string :amount

      t.timestamps
    end
  end
end

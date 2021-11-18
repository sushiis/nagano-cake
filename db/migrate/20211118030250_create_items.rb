class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.boolean :status, null: false
      

      t.timestamps
    end
  end
end

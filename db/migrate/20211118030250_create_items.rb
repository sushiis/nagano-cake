class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
    
      t.string :name
      t.string :introduction
      t.integer :price
      t.string :image_id
      t.boolean :status
      

      t.timestamps
    end
  end
end

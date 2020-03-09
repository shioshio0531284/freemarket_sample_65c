class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,  null:false
      t.text :description, null:false
      t.text :status, null:false
      t.string :postage, null:false
      t.string :delivery_way, null:false
      t.string :delivery_area, null:false
      t.string :delivery_date, null:false
      t.integer :price, null:false
      t.text :category
      t.text :size 
      t.text :brand
      t.timestamps
    end
  end
end


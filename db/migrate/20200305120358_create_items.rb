class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,  null:false
      t.text :description
      t.text :status
      t.string :postage
      t.string :delivery_way
      t.string :delivery_area
      t.string :delivery_date
      t.integer :price, null:false
      t.text :category
      t.text :size 
      t.text :brand
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end


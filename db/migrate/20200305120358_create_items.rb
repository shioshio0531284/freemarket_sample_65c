class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,  null:false
      t.text :description
      t.integer :status, default: 0
      t.integer :postage, default: 0
      t.integer :delivery_way, default: 0
      t.integer :delivery_area,default: 0
      t.integer :delivery_day,default: 0
      t.integer :price, null:false
      t.integer :category, default: 0
      t.integer :size, default: 0 
      t.text :brand
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end


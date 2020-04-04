class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,  null:false
      t.text :description, null:false
      t.integer :status, null:false
      t.integer :postage, null:false
      t.integer :delivery_way, null:false
      t.integer :delivery_area, null:false
      t.integer :delivery_day, null:false
      t.integer :price, null:false
      t.integer :category, null:false
      t.integer :size
      t.text :brand
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end


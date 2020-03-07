class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,  null:false
      t.string :image,  null:false
      t.description :text, null:false
      t.status :text, null:false
      t.postage :string, null:false
      t.delivery_way :string, null:false
      t.delivery_area :string, null:false
      t.delivery_date :string, null:false
      t.price :integer, null:false
      t.category :text
      t.size :text
      t.brand :text
      t.timestamps
    end
  end
end


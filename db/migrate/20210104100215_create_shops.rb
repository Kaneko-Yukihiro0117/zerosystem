class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :item_name,    null: false
      t.string :store_name,   null: false
      t.text :detail,         null: false
      t.float :latitude,      null: false, precision: 11, scale: 8
      t.float :longitude,      null: false, precision: 11, scale: 8
      t.integer :category_id, null: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end

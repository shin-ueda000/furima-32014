class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                  null: false
      t.text   :description_of_item ,   null: false
      t.integer :category_id,           null: false
      t.integer :product_condition_id,  null: false
      t.integer :shipping_charge_id,   null: false
      t.integer :shipping_area_id,      null: false
      t.integer :days_to_sip_id,        null: false
      t.integer :selling_price,         null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end

class CreateSellitems < ActiveRecord::Migration[5.2]
  def change
    create_table :sellitems do |t|
      t.string     :name,  null: false
      t.integer    :price
      t.references :user,  foreign_key: true
      t.string     :text,  null:false
      t.string     :category_id
      t.string     :condition,   null: false
      t.string     :send_cost,   null: false
      t.string     :send_method, null: false
      t.string     :send_place,  null: false
      t.string     :send_day,    null: false
      t.timestamps
    end
  end
end

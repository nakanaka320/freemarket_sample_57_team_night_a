class CreateSellitems < ActiveRecord::Migration[5.2]
  def change
    create_table :sellitems do |t|
      t.string     :name,  null: false
      t.integer    :price
      t.references :user,  foreign_key: true
      t.string     :text,  null:false
      t.string     :category_id
      t.integer     :condition,   null: false
      t.integer     :send_cost,   null: false
      t.integer     :send_method, null: false
      t.integer     :send_place,  null: false
      t.integer     :send_day,    null: false
      t.integer     :status, default: 0
      t.timestamps
    end
  end
end

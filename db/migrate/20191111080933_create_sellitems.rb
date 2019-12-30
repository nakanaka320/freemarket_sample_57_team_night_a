class CreateSellitems < ActiveRecord::Migration[5.2]
  def change
    create_table :sellitems do |t|
      t.string     :name,  null: false
      t.integer    :price, null:false
      t.references :user,  null: false, foreign_key: true
      t.text       :image, null: false
      t.string     :text,  null:false
      t.timestamps
    end
  end
end

class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.text :good, null: false
      t.references :user, null: false, foreign_key: true
      t.references :sellitem, null: false, foreign_key: true
      t.references :buyitem, null: false, foreign_key: true
      t.timestamps
    end
  end
end

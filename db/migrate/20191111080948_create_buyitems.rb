class CreateBuyitems < ActiveRecord::Migration[5.2]
  def change
    create_table :buyitems do |t|
      t.references :sellitem, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

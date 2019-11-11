class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :state, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.integer :post_number, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :fullname,null: false
      t.string :first_name,null: false
      t.string :last_name,null: false
      t.integer :cards
      t.string :password,null: false
      t.string :E_mail,null: false, unique: true
      t.date :birth,null:false
      t.integer :phone_number,null: false
      t.string :comment,null:false
      t.timestamp :good, null: false
      t.string :sellitem, null: false
      t.string :buyitem, null: false
      t.timestamps
    end
  end
end

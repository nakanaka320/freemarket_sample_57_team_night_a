class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :number
      t.integer :exp_month
      t.integer :exp_year
      t.integer :cvc

      t.timestamps
    end
  end
end

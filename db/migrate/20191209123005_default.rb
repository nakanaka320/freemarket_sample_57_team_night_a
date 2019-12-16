class Default < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :fullname,   :string,  default: '無名'
    change_column :users, :comment,    :string,  default: '未記入'
    change_column :users, :good,       :integer, default: '0'
    change_column :users, :sellitem,   :string,  default: '未販売'
    change_column :users, :buyitem,    :string,  default: '未購入'
    change_column :users, :prefecture, :string,  default: '未記入'
  end

  def down
    change_column :users, :fullname,   :string
    change_column :users, :comment,    :string
    change_column :users, :good,       :integer
    change_column :users, :sellitem,   :string
    change_column :users, :buyitem,    :string
    change_column :users, :prefecture, :string
  end

end
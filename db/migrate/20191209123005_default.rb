class Default < ActiveRecord::Migration[5.2]
<<<<<<< HEAD
  # def change
  #   # create_table :users do |t|
  #   change_column_null :users, :fullname, false, 0
  #   change_column_null :users, :comment, false, 0
  #   change_column_null :users, :good, false, 0
  #   change_column_null :users, :sellitem, false, 0
  #   change_column_null :users, :buyitem, false, 0
  #   change_column_null :users, :prefecture, false, 0
  # end
=======
>>>>>>> 2e15b99f23481d57c770b2b93dd7c37607c7bce7
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
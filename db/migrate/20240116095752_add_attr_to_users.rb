class AddAttrToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :username, :string
    add_column :users, :description, :text
  end
end

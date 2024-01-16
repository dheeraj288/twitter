class ChangeFollowDataType < ActiveRecord::Migration[6.1]
  def change
    change_column :follows, :user_id, :string
    change_column :follows, :following_id, :string
  end
end

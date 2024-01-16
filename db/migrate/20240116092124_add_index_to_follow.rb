class AddIndexToFollow < ActiveRecord::Migration[6.1]
  def change
    add_index :follows, :following_id
    add_index :follows, :user_id
    add_index :follows, [:following_id, :user_id], unique: true
  end
end

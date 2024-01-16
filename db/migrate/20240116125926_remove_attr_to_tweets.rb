class RemoveAttrToTweets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tweets, :content, :text
    add_column :tweets, :message, :text
  end
end

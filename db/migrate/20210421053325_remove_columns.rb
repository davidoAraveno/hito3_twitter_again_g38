class RemoveColumns < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :tweets, :tweet_id
  end
end

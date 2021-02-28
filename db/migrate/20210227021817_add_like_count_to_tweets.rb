class AddLikeCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :like_count, :integer
  end
end

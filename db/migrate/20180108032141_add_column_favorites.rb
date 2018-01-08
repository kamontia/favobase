class AddColumnFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :tweet_id, :integer, :null => false
    add_column :favorites, :text, :string, :null => false
    add_column :favorites, :user_id, :integer, :null => false
    add_column :favorites, :favorite_count, :integer, :null => false
    execute "ALTER TABLE favorites ADD PRIMARY KEY (tweet_id);"
  end
end



class CreateFavoriteUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_users do |t|
      t.references :user, foreign_key: true
      t.integer :tweet_id
      t.timestamps
    end
    execute "ALTER TABLE favorite_users ADD CONSTRAINT fk_favorite_users FOREIGN KEY (tweet_id) REFERENCES favorites(tweet_id);"
  end
end

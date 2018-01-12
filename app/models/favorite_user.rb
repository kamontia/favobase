class FavoriteUser < ApplicationRecord
  belongs_to :user, foreign_key: 'id', primary_key: 'id'
  belongs_to :favorite, foreign_key: 'tweet_id', primary_key: 'tweet_id'
end

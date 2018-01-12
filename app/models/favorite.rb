class Favorite < ApplicationRecord
  has_many :users, through: :favorite_users
  has_many :favorite_users
  accepts_nested_attributes_for :favorite_users
  attr_accessor :contents
  self.primary_key = "tweet_id"

  def initialize(contents)
    @contents = contents
  end
end

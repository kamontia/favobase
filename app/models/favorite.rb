class Favorite < ApplicationRecord
  attr_accessor :contents
  self.primary_key = "tweet_id"

  def initialize(contents)
    @contents = contents
  end
end

class User < ApplicationRecord
  has_many :favorites, through: :favorite_users
  has_many :favorite_users
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.nickname = auth['info']['nickname']
    end
  end
end

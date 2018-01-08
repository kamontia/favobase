class FavoriteController < ApplicationController
  require 'net/http'
  require 'json'
  require 'oauth'

  helper_method :current_user

  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
      config.access_token = Rails.application.secrets.twitter_access_token
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret
    end

    # Prepare using Twitter API
    # TODO: Method
    consumer = OAuth::Consumer.new(
      Rails.application.secrets.twitter_consumer_key,
      Rails.application.secrets.twitter_consumer_secret,
      site: 'https://api.twitter.com/'
    )
    endpoint = OAuth::AccessToken.new(consumer, Rails.application.secrets.twitter_access_token, Rails.application.secrets.twitter_access_token_secret)

    # Create request and Reqest via GET
    # TODO: Method
    user_id = current_user.uid
    pp user_id
    response = endpoint.get('https://api.twitter.com/1.1/favorites/list.json?user_id='+user_id)

    result = JSON.parse(response.body)
    # pp result

    @favorite_list = []
    result.take(20).each do |fv|
      tmp = fv['text']
      @favorite_list << tmp
    end

    pp @favorite_list

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorite_list } # jsonを指定した場合、jsonフォーマットで返す
    end
end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    pp @current_user
  end
end

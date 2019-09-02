class TweetsController < ApplicationController
  def index

    if session[:token].present?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = Rails.application.credentials.twitter_token
        config.consumer_secret     = Rails.application.credentials.twitter_token_secret
        config.access_token        = session[:token]
        config.access_token_secret = session[:token_secret]
      end

      @tweets = client.home_timeline
      # puts @tweets.to_json

    end
  end

  def login
    @response = request.env['omniauth.auth']
    # puts @response.to_json
    session[:username] = @response[:info][:nickname]
    session[:token] = @response[:credentials][:token]
    session[:token_secret] = @response[:credentials][:secret]
    redirect_to '/'
  end

  def logout
    reset_session
    redirect_to '/'
  end
end

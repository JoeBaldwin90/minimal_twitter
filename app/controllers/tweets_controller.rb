class TweetsController < ApplicationController
  def index

    if session[:token].present?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = 'OuyD2ohfHuUDfpA0BJoVNj2fL'
        config.consumer_secret     = 'uJbKjucwV0kEaiMaskpWOsOmlOM62ArRquH9dxaDG2T7by6zii'
        config.access_token        = session[:token]
        config.access_token_secret = session[:token_secret]
      end

      @tweets = client.home_timeline

    end
  end

  def login
    @response = request.env['omniauth.auth']
    puts @response
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

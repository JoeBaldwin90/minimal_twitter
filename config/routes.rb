Rails.application.routes.draw do

  get "/auth/twitter/callback", to: "tweets#login"
  get "/logout", to: "tweets#logout"

  get "/", to: "tweets#index"

end

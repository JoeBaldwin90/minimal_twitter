# Minimal Twitter
Minimal Twitter is a Rails application which displays a logged-in user's tweets in a clean, stylish way. [Try it out yourself!](https://obscure-cove-69098.herokuapp.com/).

## Goal
To create an application that allows users to "sign-in with Twitter".  

#### Timeframe
Two days

## Features
- User log-in with [Omniauth](https://github.com/omniauth/omniauth) and [Omniauth-twitter](https://github.com/arunagw/omniauth-twitter).
- Pulling in Twitter API data with the [Twitter](https://github.com/sferik/twitter) gem.

## Technologies used
- Ruby on Rails
- Rails credentials
- Sessions
- Git / GitHub
- Heroku
- Twitter for developers
- Omniauth (gem)
- Omniauth-twitter (gem)
- Twitter (gem)

## Logging in
Anyone with a Twitter account can use this app.

## App overview
When a new session is created by clicking "Log in with Twitter", the user's auth token and secret is stored from the "OmniAuth AuthHash" that is returned by `request.env['omniauth.auth']`. This data is then passed into the configuration options that are needed to pull user's data from Twitter's API. Once authorised, this app utilises the user's API data returned by the `client.home_timeline` method to display their tweet history. E.g. `<%= tweet.retweet_count %>`

## Challenges
Frustratingly, the biggest challenge I had wasn't related to building the app. I forgot to set my rails master key when adding the app to Heroku. As a result, I had lots of "Bad Authentication Data" errors on the production site because my Auth data was hidden in my Credentials file. It should have been an obvious and easy fix, so I've added the correct process to my Quiver library to save myself time in the future.  

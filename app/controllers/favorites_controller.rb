# -*- coding: utf-8 -*-
require 'twitter'

class FavoritesController < ApplicationController

def index

  if signed_in?
    client = Twitter::REST::Client.new(
                                       :consumer_key => ENV['TWITTER_KEY'],
                                       :consumer_secret => ENV['TWITTER_SECRET'],
                                       :oauth_token => session[:oauth_token],
                                       :oauth_token_secret => session[:oauth_token_secret]
                                       )
    favorites = client.favorites()
    favorites.each do |favorite|
          @result = favorite.text
    end
  else
    @result = :not_signed_in
  end
end

end

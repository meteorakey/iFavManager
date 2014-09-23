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
      @favorites = client.favorites(:count => 5)
    else
      @result = :not_signed_in
    end
  end

  def destroy
    if signed_in?
      client = Twitter::REST::Client.new(
                                         :consumer_key => ENV['TWITTER_KEY'],
                                         :consumer_secret => ENV['TWITTER_SECRET'],
                                         :oauth_token => session[:oauth_token],
                                         :oauth_token_secret => session[:oauth_token_secret]
                                         )
      unfavorites = []
      tweets = params[:tweets]
      tweets.each do |t|
        if t[:flag] != nil
          unfavorites << t[:id]
        end
      end
      #render :text => unfavorites
      client.unfavorite(unfavorites)
      redirect_to :action => :index
    end
  end
end

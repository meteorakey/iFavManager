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
      @favorites = client.favorites(:count => 100)
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
      client.unfavorite(params[:id])
      redirect_to :action => :index
    end
  end

  def create

    # ready filepath
    fileName = File.basename(params[:id])
    dirName = "~/"
    filePath = dirName + fileName

    # create folder if not exist
    FileUtils.mkdir_p(dirName) unless FileTest.exist?(dirName)

    # write image adata
    open(filePath, 'wb') do |output|
      open(url) do |data|
        output.write(data.read)
      end
    end
    redirect_to :action => :index
  end

end

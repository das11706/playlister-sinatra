require 'rack-flash'

class SongsController < ApplicationController 
  use Rack::Flash
  enable :sessions

  get '/songs' do 
    @songs = Song.all 
    erb :'/songs/index'
  end

  # get '/songs/new' do 
  #   @artists = Artist.all 
  #   erb :'/songs/new'
  # end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    # @song = Song.find_by(params[:id])
    erb :'/songs/show'
  end

  # post '/songs' do
  #   @song = Song.create(params[:song])
  #   if !params["artist"]["name"].empty?
  #     @song.artist = Artist.create(name: params["artist"]["name"])
  #     @song.save
  #   end
  #   redirect to "/songs/#{@song.slug}"
  # end

end
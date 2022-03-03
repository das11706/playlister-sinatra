require 'rack-flash'

class SongsController < ApplicationController 
  use Rack::Flash
  enable :sessions

  get '/songs' do 
    @songs = Song.all 
    erb :'/songs/index'
  end

  get '/songs/new' do 
    @artists = Artist.all 
    # @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

  post '/songs/:slug' do
    @song = Song.create(params[:song])
    # binding.pry
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
      @song.save
    end
    if !params["genre"]["name"].empty?
      @song.genre = Genre.create(name: params["genre"]["name"])
      @song.save
      # @song = Song.create(params[:song])
    end
    redirect to "/songs/#{@song.slug}"
  end

end
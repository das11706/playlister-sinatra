require 'rack-flash'

class SongsController < ApplicationController 
  use Rack::Flash
  enable :sessions

  get '/songs' do 
    @songs = Song.all 
    # binding.pry
    erb :'/songs/index'
  end

  get '/songs/new' do 
    @artists = Artist.all 
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

 post '/songs' do
  # binding.pry
  @song = Song.create(params[:song])
  
  # NOTES: find or create the artist = @song.artist
  @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
  # @song.genre_ids = Genre.find_or_create_by(name: params["genre"])
  @song.genre_ids = params[:genres]
  @song.save
  # binding.pry
  flash[:message] = "Successfully created song."
  redirect to("/songs/#{@song.slug}")
 end

 get '/songs/:slug/edit' do
    # @artists = Artist.all
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
   erb :'/songs/edit' 
 end

 patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.update(params["artist"])
    @song.update(params["song"])
    # binding.pry
  flash[:message] = "Successfully updated song."
  redirect to "/songs/#{@song.slug}"
  end

end


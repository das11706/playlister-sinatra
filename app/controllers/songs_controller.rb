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
    # @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'
  end

 post '/songs' do
  @song = Song.create(params[:song])
  
  # NOTES: find or create the artist = @song.artist
  @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
  # @song.genre = Genre.find_or_create_by(name: params["genre"])
  # @song.genre = Genre.create(params[:genre])
  @song.save
  # binding.pry
  redirect to "/songs/#{@song.slug}"  
 end

end

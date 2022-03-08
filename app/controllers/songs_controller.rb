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

  # post '/songs' do
  #   # binding.pry
  #   @artist = Artist.create(params[:artist])
  #   # @artist =  @song.artist 
  #   @song.artist = @artist 
  #   @song = Song.create(name: params[:song][:name])
    
  #   # puts "Testing Pry"
  #   # binding.pry
  #   redirect to "/songs/#{@song.slug}"  
  # end

  post '/songs' do
    # @artist = Artist.create(name: params[:artist][:name])
    # @song.artist = @artist
    # @song = Song.create(name: params[:song][:name])
    # @artist = @song.artist 
    # @song.artist = @artist
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    @song = Song.find_or_create_by(name: params[:song][:name])
    @song.artist = @artist 
    
    # binding.pry
    redirect to "/songs/#{@song.slug}"  
  end

end
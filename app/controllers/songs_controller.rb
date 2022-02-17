class SongsController < ApplicationController 
  
  get '/songs' do 
    @songs = Song.all 
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    
  end

  get '/songs/new' do 
    @artists = Artist.all 
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    
  end

end
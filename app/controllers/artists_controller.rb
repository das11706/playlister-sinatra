class ArtistsController < ApplicationController
  
  get '/artists' do 
    @artists = Artist.all 
    erb :'/artists/index'
  end
 
  # get '/artists/new' do 
  #   @songs = Song.all 
  #   erb :'/artists/new'
  # end

  # post '/artists' do 
  #   @artist = Artist.create(params[:artist])
  # end

end

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


  get '/artists/:slug' do
    # binding.pry
    @artist = Artist.find_by_slug(params[:slug])
    # binding.pry
    # @song = Song.find_by(params[:id])
    erb :'/artists/show'
  end
end

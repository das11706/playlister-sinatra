# require 'rack-Flash'

class GenresController < ApplicationController
  # use Rack::Flash
  # enable :sessions

  get '/genres' do
    @genres = Genre.all 
    erb :'/genres/index'
  end

  get '/genres/new' do
    @artists = Artist.all
    @songs = Song.all
    erb :'/genres/new'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  # post '/genres' do
  #   @genre = Genre.create(params[:genre])
  #   if !params["artist"]["name"].empty?
  #     @genre.artist = Artist.create(name: params["artist"]["name"])
  #     @genre.save
  #   end
  #   if !params["song"]["name"].empty?
  #     @genre.song = Song.create(name: params["song"]["name"])
  #     @genre.save
  #   end
  #   redirect to "/genres/#{@genre.slug}"
  # end
  
end



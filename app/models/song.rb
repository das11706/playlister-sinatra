class Song < ActiveRecord::Base
  include Slugifiable
  
  belongs_to :artist 
  belongs_to :genre
  has_many :song_genres
  has_many :genres, through: :song_genres 
end
class Song < ActiveRecord::Base
  

  belongs_to :artist 
  belongs_to :genre
  has_many :song_genres
  has_many :genres, through: :song_genres 

  


  def slug
    name.gsub(" ", "-")
  end
end
class Genre < ActiveRecord::Base
  # include Slugifiable

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres  

  def slug
    name.gsub(" ", "-")
  end
end
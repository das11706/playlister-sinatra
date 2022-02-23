class Song < ActiveRecord::Base
  
  belongs_to :artist 
  belongs_to :genre
  has_many :song_genres
  has_many :genres, through: :song_genres 

  def slug
    slug_name = name.downcase.gsub(" ", "-")
    slug_name
  end

  def self.find_by_slug(slug)
    Song.all.find do |song|
      if song.slug == slug
        song
      end
    end
  end
  
end


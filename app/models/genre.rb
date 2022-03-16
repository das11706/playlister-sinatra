class Genre < ActiveRecord::Base
  # include Slugifiable

  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs  

  def slug
    slug_name = name.downcase.gsub(" ", "-")
    slug_name
  end

  def self.find_by_slug(slug)
    Genre.all.find do |genre|
      if genre.slug == slug
        genre
      end
    end
  end
end






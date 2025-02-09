class Artist < ActiveRecord::Base
  # include Slugifiable

  has_many :songs
  has_many :genres, through: :songs

  def slug
     name.downcase.gsub(" ", "-") 
  end

  
  def self.find_by_slug(slug)
    Artist.all.find do |artist|
      if artist.slug == slug
        artist
      end
    end
  end
end
class Artist < ActiveRecord::Base
  # include Slugifiable

  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.gsub(" ", "-")
  end

  def find_by_slug
    
  end
end
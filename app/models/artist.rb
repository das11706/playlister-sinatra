class Artist < ActiveRecord::Base
  # include Slugifiable

  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.gsub(" ", "-")
  end
end
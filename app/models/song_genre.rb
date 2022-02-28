class SongGenre < ActiveRecord::Base
  # include Slugifiable

  belongs_to :genre
  belongs_to :song 
end
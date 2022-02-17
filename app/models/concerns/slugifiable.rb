module Slugifiable
    def slug(name)
      artist_match = filename.match(/^(.*) -/)
      song_match   = filename.match(/- (.*) \[/)
      genre_match  = filename.match(/\[([^\]]*)\]/)
      if name == artist_match
        artist_match.gsub(name, "-")
      elsif name == song_match
        song_match.gsub(name, "-")
      elsif name == genre_match
        genre_match.gsub(name, "-")
    end

    def find_by_slug

    end

end

    
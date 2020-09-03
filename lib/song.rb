class Song
    attr_accessor :name

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        if artist
            self.artist = artist
        end
        if genre
            self.genre = genre
        end
    end

    def self.create(name)
        song = self.new(name)
        song.save
        song
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def artist=(artist)
      @artist = artist
      artist.add_song(self)
    end

    def artist
      @artist
    end

    def genre=(genre)
      @genre = genre
      genre.add_song(self)
    end

    def genre
      @genre
    end

    def self.destroy_all
        @@all.clear
    end

    def self.find_by_name(name)
      self.all.each do | song |
        if song.name == name
          return song
        end
      end
      nil
    end

    def self.find_or_create_by_name(name)
      if self.find_by_name(name) == nil
        return self.create(name)
      else
        return self.find_by_name(name)
      end
    end
end

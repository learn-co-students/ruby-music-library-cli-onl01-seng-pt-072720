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

    def self.new_from_filename(filename)
      artist_name = filename.split(" - ")[0]
      song_name = filename.split(" - ")[1]
      genre_name = filename.split(" - ")[2].chomp(".mp3")
      song = self.find_or_create_by_name(song_name)
      song.artist = Artist.find_or_create_by_name(artist_name)
      song.genre = Genre.find_or_create_by_name(genre_name)
      song
    end

    def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song
    end
end
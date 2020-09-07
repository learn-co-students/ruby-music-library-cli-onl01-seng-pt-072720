class Artist
    extend Concerns::Findable

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
    end

    def self.create(name)
        artist = self.new(name)
        artist.save
        artist
    end
    
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        @@all.clear
    end

    def songs
        @songs
    end

    def genres
        genres = []
        songs.collect do | song |
            genres << song.genre
        end
        genres.uniq
    end

    def add_song(song)
        if song.artist != self
            song.artist = self
        end
        if !@songs.include?(song)
            @songs << song
        end
        # song.artist = self unless song.artist == self
        # @songs << song unless @songs.include?(song)
    end
end